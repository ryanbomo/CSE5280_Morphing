function morphed_im = morph(im1, im2, im1_X, im1_Y, im2_X, im2_Y, tri, warp_frac, dissolve_frac)

% Draw Average Face
figure;
set(gcf, 'color','w');
set(gcf, 'Position', [0, 0, 100, 100])
imshow(im2);
title('Source image and triangulation');
drawnow;
hold on;
raw_X_av = (im2_X*(warp_frac) + im1_X*(1-warp_frac))
raw_Y_av = (im2_Y*(warp_frac)+ im1_Y*(1-warp_frac))
X_av = raw_X_av * [640]
Y_av = raw_Y_av *[480]

i = 1
while i <= length(tri)
    %compute affine for each triangle
    tri(i,1:3)
    i = i+1
end

triplot(tri,X_av,Y_av);
hold off;
return
end