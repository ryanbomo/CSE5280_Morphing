function morphed_im = morph(im1, im2, im1_X, im1_Y, im2_X, im2_Y, tri, warp_frac, dissolve_frac)

finalImage1 = uint8(zeros(480,640,3));
% Draw Average Face
raw_X_av = (im2_X*(warp_frac) + im1_X*(1-warp_frac));
raw_Y_av = (im2_Y*(warp_frac)+ im1_Y*(1-warp_frac));
X_av = raw_X_av * 640;
Y_av = raw_Y_av *480;



for iTriangle = 1 : length(tri)
    
    % Estimate the transformation between two shapes. 
    tri( iTriangle, 1:3)
    img1_X_Vals = [im1_X(tri(iTriangle,1))*640, im1_X(tri(iTriangle,2))*640, im1_X(tri(iTriangle,3))*640];
    img1_Y_Vals = [im1_Y(tri(iTriangle,1))*480, im1_Y(tri(iTriangle,2))*480, im1_Y(tri(iTriangle,3))*480];
    img2_X_Vals = [im2_X(tri(iTriangle,1))*640, im2_X(tri(iTriangle,2))*640, im2_X(tri(iTriangle,3))*640];
    img2_Y_Vals = [im2_Y(tri(iTriangle,1))*480, im2_Y(tri(iTriangle,2))*480, im2_Y(tri(iTriangle,3))*480];
    target_X_Vals = [X_av(tri(iTriangle,1)), X_av(tri(iTriangle,2)), X_av(tri(iTriangle,3))];
    target_Y_Vals = [Y_av(tri(iTriangle,1)), Y_av(tri(iTriangle,2)), Y_av(tri(iTriangle,3))];
    
    
    A = estimateAffineBetweenShapes(img1_X_Vals, img1_Y_Vals, target_X_Vals, target_Y_Vals);
    B = estimateAffineBetweenShapes(img2_X_Vals, img2_Y_Vals, target_X_Vals, target_Y_Vals);
            
    % Convert our transformation matrix to matlab's own transformation format.
    % Matlab functions that construct tforms expect the input matrix in
    % transpose form.
    tform1 = affine2d(A');
    tform2 = affine2d(B');
    
    % This step applies the estimated affine warp to the source image. We
    % use "OutputView" to force the dimension of the transformed image to
    % be equal to that of the final destination image so we can just add
    % all the warps together (We can only add matrices of the same size).
    J = imwarp(im1,tform1,'OutputView',imref2d(size(finalImage1)));
    H = imwarp(im2,tform2,'OutputView',imref2d(size(finalImage1)));
    

    % Calculate a binary mask of the region of interest - ROI (1=inside
    % region, 0=outside region). The ROI is created from the triangle
    % coordinates.
    BW1 = roipoly(J,target_X_Vals,target_Y_Vals);
    BW2 = roipoly(H,target_X_Vals,target_Y_Vals);

    % Create a 3-D mask (RGB). The original BW mask produced by the
    % previous step is 2-D. To mask a color image (i.e., RGB), we need a
    % 3-D mask.
    BW1_3 = false(size(J,1),size(J,2),3);   % We need a logical matrix
    BW1_3(:,:,1) = BW1;  % Red component 
    BW1_3(:,:,2) = BW1;  % Green component 
    BW1_3(:,:,3) = BW1;  % Blue component 
    BW2_3 = false(size(H,1),size(H,2),3);   % We need a logical matrix
    BW2_3(:,:,1) = BW2;  % Red component 
    BW2_3(:,:,2) = BW2;  % Green component 
    BW2_3(:,:,3) = BW2;  % Blue component     
    
    % RGB image for storing the extracted warped region 
    Imasked1 = zeros(size(J),class(J));
    Imasked2 = zeros(size(H),class(H));
    
    % Use the 3-D mask to get the pixel values from the RGB image 
    Imasked1(BW1_3) = J(BW1_3);   % Mask works as indices for the pixels 
    Imasked2(BW2_3) = H(BW2_3);   % Mask works as indices for the pixels 
    
    final_mask = Imasked1*(1-dissolve_frac)+Imasked2*(dissolve_frac);
    
       

    % Increamentally add all warped triangles to form a single image with
    % all warped triangular regions. 
    finalImage1 = finalImage1 + final_mask;
    
    snapnow;
    drawnow;
end

% merge two faces together% Show the region

morphed_im = finalImage1;


figure; 
set(gcf, 'color','w'); 
set(gcf, 'Position', [0, 0, 200, 200])
imshow(morphed_im); 
title('Face and Mask'); 
drawnow;
hold on;
triplot(tri,X_av,Y_av);
hold off;


return

function A = estimateAffineBetweenShapes(x1, y1, x2, y2)
% 
%  Calculates affine between mean shape 1 and shape 2.
%  We assume that transformation is:  A * (x1, y1, 1) = (x2, y2, 1).  
%  
%
NumPairs = size(x1,2);    % Number of pairs of points.  
M = zeros( 2*NumPairs, 6 );  % System matrix. 
j = 1; 
for i = 1 : NumPairs         % Each pair of points yields two constraints
    M(j   ,:)  = [ x1(i)   y1(i)    1       0      0   0 ]; 
    j = j + 1; 
end
for i = 1 : NumPairs         % Each pair of points yields two constraints
    M(j ,:)  = [    0      0    0    x1(i)   y1(i)   1 ];
    j = j + 1; 
end


% Vector b in the least-squares equation
b = [ x2'; y2' ];

% Least-squares solution using matlab's \ operator
a = M \ b;

%%
% We re-construct the affine transformation matrix using the estimated
% values.  
A = [ a(1) a(2)  a(3); ...
      a(4) a(5)  a(6); ...
       0.0  0.0  1.0];

   
return 