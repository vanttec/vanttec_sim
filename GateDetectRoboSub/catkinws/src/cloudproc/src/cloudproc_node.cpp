#include <ros/ros.h>
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include "pcl_ros/transforms.h"
#include <pcl/PCLPointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/visualization/cloud_viewer.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/common/common.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/segmentation/extract_clusters.h>
#include <pcl/kdtree/kdtree.h>
#include "geometry_msgs/Point.h"
#include <pcl/filters/filter.h>
#include <pcl/visualization/point_cloud_color_handlers.h>
#include <pcl/visualization/point_cloud_handlers.h>
#include <pcl/filters/voxel_grid.h>
// #include <pcl/surface/npi
#include <vector>
#include <pcl/filters/passthrough.h>

typedef pcl::PointCloud<pcl::PointXYZRGB> PointCloud;

// pcl::visualization::CloudViewer test_viewer("Point Cloud");

boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer(
    new pcl::visualization::PCLVisualizer ("Visualizer")
);

pcl::PCLPointCloud2* cloud = new pcl::PCLPointCloud2;
pcl::PCLPointCloud2ConstPtr cloudPtr(cloud);

pcl::PCLPointCloud2* cloud_filtered = new pcl::PCLPointCloud2;
pcl::PCLPointCloud2Ptr cloud_filtered_ptr (cloud_filtered);

pcl::PointCloud<pcl::PointXYZRGB>::Ptr temp_cloud(new pcl::PointCloud<pcl::PointXYZRGB>);
pcl::PointCloud<pcl::PointXYZRGB>::Ptr filtered_cloud(new pcl::PointCloud<pcl::PointXYZRGB>);

std::vector<pcl::PointIndices> cluster_indices;

//Eucledian clustering objclusterert
pcl::search::KdTree<pcl::PointXYZRGB>::Ptr tree(new pcl::search::KdTree<pcl::PointXYZRGB>);

pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_cluster (new pcl::PointCloud<pcl::PointXYZRGB>);

pcl::EuclideanClusterExtraction<pcl::PointXYZRGB> clusterer;


//Stores individual clusters as point clouds
std::vector<pcl::PointCloud<pcl::PointXYZRGB>::Ptr> segments;

ros::Publisher gate_down_pub,
    gate_upper_pub,
    gate_left_waypoint,
    gate_right_waypoint;

void callback(const sensor_msgs::PointCloud2ConstPtr& cloud_msg) {

    viewer->removeAllShapes();
    viewer->removeAllPointClouds();
    segments.clear();
    segments.reserve(10);
    cluster_indices.clear();

    pcl_conversions::toPCL(*cloud_msg, *cloud);

    clusterer.setClusterTolerance (0.2); // 2cm
    clusterer.setMinClusterSize (100);
    clusterer.setMaxClusterSize (25000);

    pcl::VoxelGrid<pcl::PCLPointCloud2> voxel_grid;
    voxel_grid.setInputCloud(cloudPtr);
    voxel_grid.setLeafSize(0.05,0.05, 0.05);
    voxel_grid.filter(*cloud_filtered_ptr);

    std::vector<int> indices;
    pcl::fromPCLPointCloud2(*cloud_filtered_ptr, *temp_cloud);

    pcl::PassThrough<pcl::PointXYZRGB> pass;
    pass.setInputCloud(temp_cloud);
    pass.setFilterFieldName("y");
    pass.setFilterLimits(-3.25, FLT_MAX); // -3.25m to inf height
    pass.filter(*filtered_cloud);

    pcl::removeNaNFromPointCloud(*filtered_cloud, *filtered_cloud, indices);

    clusterer.setSearchMethod(tree);
    clusterer.setInputCloud(filtered_cloud);
    clusterer.extract(cluster_indices);

    for (std::vector<pcl::PointIndices>::const_iterator it = cluster_indices.begin (); it != cluster_indices.end (); ++it) {
        pcl::PointCloud<pcl::PointXYZRGB>::Ptr individual_cluster (new pcl::PointCloud<pcl::PointXYZRGB>);

        for (std::vector<int>::const_iterator pit = it->indices.begin (); pit != it->indices.end (); ++pit)
            individual_cluster->push_back((*filtered_cloud)[*pit]);
        individual_cluster->width = individual_cluster->size();
        individual_cluster->height = 1;
        individual_cluster->is_dense = true;
        segments.push_back(individual_cluster);
    }

    int counter = 0;

    pcl::PointXYZRGB min_p, max_p, mid_p, gate_mid_p;

    pcl::PointCloud<pcl::PointXYZRGB>::Ptr gate;

    float max_diagonal = 0;
    pcl::PointXYZRGB maxleft, maxright;

    for (pcl::PointCloud<pcl::PointXYZRGB>::Ptr seg : segments) {
        pcl::getMinMax3D(*seg, min_p, max_p);

        mid_p.x = (min_p.x + max_p.x) / 2;
        mid_p.y = (min_p.y + max_p.y) / 2;
        mid_p.z = (min_p.z + max_p.z) / 2;

        float diagonal = std::sqrt(std::pow(max_p.x - min_p.x, 2) + std::pow(max_p.y - min_p.y, 2) + std::pow(max_p.z - min_p.z, 2));
        if (diagonal > max_diagonal) {
            max_diagonal = diagonal;
            gate = seg;
            gate_mid_p = mid_p;
            maxright = min_p;
            maxleft = max_p;
        } else {
            pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZRGB> color_handler(
                seg,
                255,
                0,
                0);
            std::string id_name = std::to_string(counter);

            viewer->addPointCloud<pcl::PointXYZRGB> (seg,color_handler ,id_name);
            viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 1, id_name);

        }
        ++counter;
    }

    if (gate != nullptr) {
        pcl::PointXYZRGB left, right, center;
        // center.x = gate->dimensions
        left = gate_mid_p;
        right = gate_mid_p;
        right.x = (gate_mid_p.x + maxright.x) / 2;
        // right.y = (gate_mid_p.y + maxright.y) / 2;
        // right.z = (gate_mid_p.z + maxright.z) / 2;

        left.x = (gate_mid_p.x + maxleft.x) / 2;
        // left.y = (gate_mid_p.y + maxleft.y) / 2;
        // left.z = (gate_mid_p.z + maxleft.z) / 2;
        viewer->addSphere(gate_mid_p, 0.05);
        viewer->addSphere(right,0.05, "right");
        viewer->addSphere(left,0.05, "left");

        viewer->addSphere(maxright,0.05, "maxr");
        viewer->addSphere(maxleft,0.05, "maxl");
        geometry_msgs::Point uppercorner, downcorner, leftw, rightw;
        uppercorner.x = maxleft.x;
        uppercorner.y = maxleft.y;
        uppercorner.z = maxleft.z;

        downcorner.x = maxright.x;
        downcorner.y = maxright.y;
        downcorner.z = maxright.z;

        leftw.x = left.x;
        leftw.y = left.y;
        leftw.z = left.z;

        rightw.x = right.x;
        rightw.y = right.y;
        rightw.z = right.z;

        gate_left_waypoint.publish(leftw);
        gate_right_waypoint.publish(rightw);
        // gate_down_pub.publish(downcorner);
        // gate_upper_pub.publish(uppercorner);

        pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZRGB> color_handler(
            gate,
            0,
            255,
            111);
        std::string id_name = "Gate";

        viewer->addPointCloud<pcl::PointXYZRGB> (gate, color_handler ,id_name);
        viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 1, id_name);
    }
    viewer->spinOnce(100);
}

int main(int argc, char** argv) {

    viewer->setBackgroundColor(0,0,0);
    segments.reserve(10);
    ros::init(argc, argv, "point_cloud_processing");
    ros::NodeHandle handler;
    gate_down_pub = handler.advertise<geometry_msgs::Point>
                    ("gate_inferior_corner", 10);
    gate_upper_pub = handler.advertise<geometry_msgs::Point>
                    ("gate_superior_corner", 10);

    gate_left_waypoint = handler.advertise<geometry_msgs::Point>
                    ("gate_left_waypoint", 10);
    gate_right_waypoint = handler.advertise<geometry_msgs::Point>
                    ("gate_right_waypoint", 10);

    ros::Subscriber subscriber = handler.subscribe("frontr200/camera/depth_registered/points", 10, callback);

    ros::spin();
}
