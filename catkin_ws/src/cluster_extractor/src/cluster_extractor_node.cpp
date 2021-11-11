#include <ros/ros.h>
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include "pcl_ros/transforms.h"
#include <pcl/PCLPointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/visualization/cloud_viewer.h>
#include <pcl/visualization/pcl_visualizer.h>
#include "geometry_msgs/Point.h"
#include <pcl/filters/filter.h>
#include <pcl/visualization/point_cloud_color_handlers.h>
#include <pcl/visualization/point_cloud_handlers.h>
#include <pcl/filters/voxel_grid.h>
#include <sensor_msgs/PointCloud2.h>
#include <message_filters/subscriber.h>
#include <message_filters/synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>
#include <ros/message_traits.h>
#include <std_msgs/Header.h>
#include <uuv_perception/obj_detected_list.h>
#include <pcl/filters/crop_box.h>

boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer(
    new pcl::visualization::PCLVisualizer ("Visualizer")
);
// pcl::visualization::CloudViewer cviewer("viewer");
pcl::PCLPointCloud2::Ptr cloud (new pcl::PCLPointCloud2);
pcl::PointCloud<pcl::PointXYZ>::Ptr res (new pcl::PointCloud<pcl::PointXYZ>);
pcl::PointCloud<pcl::PointXYZ>::Ptr temp_cloud (new pcl::PointCloud<pcl::PointXYZ>);
pcl::CropBox<pcl::PointXYZ> crop;
bool started = false;
// Cloud size: 640 x 480
// YOLO data: 640 x 480 
pcl::PointCloud<pcl::PointXYZ>::Ptr segment(new pcl::PointCloud<pcl::PointXYZ>);

void callback(const boost::shared_ptr<const sensor_msgs::PointCloud2>& point_cloud, 
    const boost::shared_ptr<const uuv_perception::obj_detected_list>& obj_list) {
    pcl_conversions::toPCL(*point_cloud, *cloud);
    pcl::fromPCLPointCloud2(*cloud, *temp_cloud);
    crop.setInputCloud(temp_cloud);
    viewer->removeAllPointClouds();

    for (int i=0; i < obj_list->len; i++) {
        // Reset segment cloud
        segment->clear();
        // For every detected object crop the surrounding box
        // Do so without error margin just to test things out
        float minx, miny, maxx, maxy;
        minx = obj_list->objects[i].x - obj_list->objects[i].w;
        miny = obj_list->objects[i].y - obj_list->objects[i].h;
        if (miny < 0) miny = 0;
        if (minx < 0) minx = 0;
        if (maxx < 0) maxx = 0;
        if (maxy < 0) maxy = 0;
        Eigen::Vector4f minp(minx, miny, 400.0, 1.0);
        maxx = obj_list->objects[i].x + obj_list->objects[i].w;
        maxy = obj_list->objects[i].y + obj_list->objects[i].h;
        Eigen::Vector4f maxp(maxx, maxy, 400.0, 1.0);
        std::cout << "max point: " << maxp << " min point: " << minp << '\n';
        crop.setInputCloud(temp_cloud);
        crop.setMin(minp);
        crop.setMax(maxp);
        crop.filter(*segment);
        std::cout << "segment size: " << segment->size() << '\n';
        viewer->addPointCloud(segment, std::to_string(i));
    }

    viewer->spinOnce(100);
}

const char* YOLO_TOPIC_NAME = "/uuv_perception/yolo_zed/objects_detected";
const char* CLOUD_TOPIC_NAME = "/frontr200/camera/depth_registered/points";

int main(int argc, char **argv) {

    ros::init(argc, argv,"cluster_extractor");
    ros::NodeHandle node_handle;
    // ros::Subscriber yolo_objects = node_handle.subscribe("/uuv_perception/yolo_zed/objects_detected", 200, callback);
    // ros::Subscriber cloud_data = node_handle.subscribe("frontr200/camera/depth_registered/points");
    message_filters::Subscriber<sensor_msgs::PointCloud2> cloud_sub(node_handle, CLOUD_TOPIC_NAME, 1);
    message_filters::Subscriber<uuv_perception::obj_detected_list> yolo_sub(node_handle, YOLO_TOPIC_NAME, 1);
    //  define alias data type for approximate time sync
    typedef message_filters::sync_policies::ApproximateTime
        <sensor_msgs::PointCloud2, uuv_perception::obj_detected_list> Policy;    
    message_filters::Synchronizer<Policy> synchronize(Policy(10), cloud_sub, yolo_sub);

    synchronize.registerCallback(boost::bind(&callback, _1, _2));
    ros::spin();
}