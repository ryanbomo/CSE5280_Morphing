# CSE5280_Morphing
Using the supplied images and data points, two things need to be accomplished:
 - Create an animation of a morph between two faces
 - Compute the mean of a population of faces

In the first task, use a photo of a person's face as Picture A and a photo of another person's face as Picture B.  Morph the still picture A into still picture B and produce 45 framces of animation numbered 0-45, where frame 0 must be identical to Picture A and frame 45 must be identical to picture B. Conver the sequence to an animated gif. In the video, each from will be displayed for 1/30 of a second.

In the second task, synthesize the average face appearance of a subset of a population from the face dataset (e.g. the average male, the average female).

## Defining Correspondences

Compute a Delaunay triangulation on a midway face. The Delaunay triangulation just uses indecies to grab coordinates, so once an average triangulation is found, corresponding triangles are quickly found in each face (assuming indices are in the same order for each face).

Points were added to better outline the head and shoulders.

## Computing the midway face
At each iteration a midway face is computed using a weighted average of the two faces. The Delaunay triangulation is found, along with a weighted average for coordinates. Then each face's corresponding triangle is mapped to the weighted average triangle. The pixels for each face are also weighted, so that the transition effect occurs. 

## The "mean face" of a population
Basically, this is one frame of the above, but with 7 faces. The smiling face of the women in the photos were used. Then a weighted average with each face being equal was done to find the midway triangulation. Then each was mapped to the triangulation using equal weights for each face's pixels. 

Points were not added to the "mean face", so the head and shoulders seem warped. For a better result, add about 19 points to each to outline the head and shoulders.