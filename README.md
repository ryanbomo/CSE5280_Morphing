# CSE5280_Morphing
Using the supplied images and data points, two things need to be accomplished:
 - Create an animation of a morph between two faces
 - Compute the mean of a population of faces

In the first task, use a photo of a person's face as Picture A and a photo of another person's face as Picture B.  Morph the still picture A into still picture B and produce 45 framces of animation numbered 0-45, where frame 0 must be identical to Picture A and frame 45 must be identical to picture B. Conver the sequence to an animated gif. In the video, each from will be displayed for 1/30 of a second.

In the second task, synthesize the average face appearance of a subset of a population from the face dataset (e.g. the average male, the average female).

## Defining Correspondences

Compute a Delaunay triangulation on a midway face.

## Computing the midway face

Before compute the whole morph sequence, compute the midway face of the images A and B.  This computation hsa three steps:
 - Compute the average shape
 - Warp both faces into that shape
 - Average the colors

The main task in warping the faces into the average shape is implementing an affine warp for each triangle in the triangulation from the original images into this new shape.  this will involve computing an affine transofmration matrix A between two triangles:
```A = computeAffine(tri_pts_1, tri_pts_2); %You will write this function
```




## The Morph Sequence

## The "mean face" of a population