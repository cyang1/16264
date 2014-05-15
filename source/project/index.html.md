---
title: Humanoids Final Project
---

<header>
# Stereo Imaging <span>Humanoids Final Project</span>
</header>
### Jeff Chen (jchen4), Cary Yang (caryy)

#### Introduction

Stereo imaging is the determination of depth information from pairs of images of the same scene from different perspectives. The most famous example of stereo imaging is the Kinect, an add-on for the Xbox, which uses the depth information for enhanced gameplay. Stereo imaging is a complex problem, and involves three main steps, rectification, correspondence, and reprojection.

#### Rectification

Stereo rectification is the process of mathematically row-aligning images. Here, row-aligned means that the cameras are coplanar, and that each row of the images have the same y-coordinate. Note that it would be exceedingly difficult, though possible, to align two identical cameras to be coplanar to skip this step.

Stereo rectification need only be run one time for a given camera setup. However, it must be run on a scene with distinctive characteristics. Generally, a chessboard is suitable for this, since one can easily find the corners of the chessboard. Going forward, we will assume that we are working with two undistorted images of the same scene, whose primary component is a non-square chessboard with easily distinguishable corners. Let's call the vectors storing these corners *C1* and *C2*, where the position of each corner is the same in each vector. Also, we will assign *(x, y)* coordinates for each corner, starting with (0, 0) at the top left corner through *(w - 1, h - 1)* for the bottom right.

Next, we introduce two matrices: the essential matrix *E* and the fundamental matrix *F*. The essential matrix *E* contains information about the translation *T* and rotation *R* that describe the location of the second camera in relation to the first. The fundamental matrix *F* contains the same information, as well as the intrinsics for both cameras, which encompass focal length, image format, and principal point. OpenCV provides the function `cv::findFundamentalMat()`, which, when given the two sets of corners, outputs the fundamental matrix of that particular setup. Assuming more than 8 points are output, OpenCV will use the RANSAC algorithm to find the matrix. In our case, since we used two of the same camera, the camera intrinsics are basically equivalent, so we do not need to adjust for this.

The next step is to find matrices that will row-align the images. For this, we use Bouguet's algorithm, which attempts to minimze distortion while maximizing common viewing area given the essential matrix. To minimize distortion, we split the rotation matrix *R* in half, so each image rotates half of *R* to align their planes. This rotation makes the images coplanar, but not row-aligned. Next, we compute the recitified left and right camera matrices, as well as projection matrices *Pl* and *Pr*. From these, we can calculate the reprojection matrix *Q*, which will come in handy later. OpenCV provides the functions `cv::StereoRectify()` and `cv::initUndistortRectifyMap()`,which do the above steps, and output the matrices necessary to row-align a pair of images.

#### Correspondence

Stereo correspondence matches features in the left and right images, outputting a disparity which is the difference in x-coordinates of the feature viewed in the two cameras.

#### Reprojection

Since we have calculated the reprojection matrix *Q* in the rectification step, it is a simple matter to find the depth of a point *(x, y)* with disparity *d*: we multiply *Q* and the matrix *[[x] [y] [d] [1]]* to obtain *[[X] [Y] [Z] [W]]*, where the final 3D coordinates are *(X/W, Y/W, Z/W)*. OpenCV provides the function `cv::reprojectImageTo3D()`, which takes a disparity image and reprojection matrix and transforms each pixel's *(x, y)* coordinates to the corresponding 3D point.

#### Further research

lol


<div id="download-btn-container">
  <a href="asst3_part3.zip" class="btn blue" role="button">
    <i class="icon ion-code-download"></i>
    Download Our Code
    <div class="description">(Final Project)</div>
  </a>
</div>
