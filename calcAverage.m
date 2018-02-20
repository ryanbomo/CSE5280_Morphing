function a = calcAverage()

numFaces = 7;
finalImage = uint8(zeros(480,640,3));
im1 = imread('avg_face_img/08-2f.jpg');
im2 = imread('avg_face_img/12-2f.jpg');
im3 = imread('avg_face_img/14-2f.jpg');
im4 = imread('avg_face_img/15-2f.jpg');
im5 = imread('avg_face_img/22-2f.jpg');
im6 = imread('avg_face_img/30-2f.jpg');
im7 = imread('avg_face_img/35-2f.jpg');

% Get list of Faces
face1_X = [0.3344506  0.3435232  0.3546119  0.37174898  0.40098286  0.43223286  0.48061997  0.52900708  0.5622732  0.58949095  0.60965222  0.62376511  0.62880546  0.5935232  0.58243448  0.56529737  0.54715222  0.53001511  0.54513609  0.56328124  0.58041835  0.38989416  0.40299898  0.42013609  0.43324092  0.44634578  0.43324092  0.41811997  0.40299898  0.53203124  0.5622732  0.58142638  0.60057962  0.61166835  0.45239416  0.43122479  0.4080393  0.38888609  0.36872479  0.41005543  0.45541835  0.48566028  0.51590222  0.56328124  0.51791835  0.48263609  0.45138609  0.47255543  0.46549898  0.45340222  0.44533771  0.45541835  0.48868448  0.52094257  0.53303933  0.52799898  0.51388609  0.50783771  0  0  1  1];
face1_Y = [0.60987622  0.65959072  0.71064878  0.75364506  0.79664135  0.8288886  0.8463558  0.82620132  0.79664135  0.76439416  0.72139788  0.66227794  0.62062532  0.49835461  0.49298009  0.48894918  0.48894918  0.49969825  0.50641644  0.51044732  0.50641644  0.49029282  0.4849183  0.48357466  0.49029282  0.50372916  0.50910372  0.50910372  0.50372916  0.45401472  0.44192201  0.43520382  0.44460928  0.45670196  0.45267108  0.43923473  0.42714202  0.43386021  0.44595289  0.66227794  0.65152889  0.65824705  0.65421617  0.6636216  0.72139788  0.72408509  0.71602333  0.50776005  0.57091087  0.57494175  0.5964399  0.62196892  0.64346707  0.61928171  0.59912717  0.57628536  0.5682236  0.50641644  0  1  0  1];
face2_X = [0.36469254  0.37578124  0.39090222  0.4171119  0.44735384  0.47860384  0.51186997  0.54513609  0.57336187  0.59957159  0.62275708  0.63586187  0.64291835  0.59856349  0.58747482  0.57033771  0.5542087  0.53807962  0.55219257  0.56932962  0.5854587  0.40501511  0.42013609  0.4372732  0.45239416  0.46449092  0.4483619  0.43324092  0.42114416  0.52497482  0.53908771  0.58848286  0.61368448  0.63182962  0.47457156  0.45541835  0.41207156  0.39493448  0.38182965  0.43223286  0.47860384  0.50481349  0.5229587  0.57840222  0.54614413  0.50783771  0.46449092  0.48666835  0.48263609  0.46045867  0.4594506  0.4796119  0.50178933  0.52094257  0.54715222  0.54513609  0.5310232  0.5219506  0  0  1  1];
face2_Y = [0.61121988  0.64749801  0.68108886  0.71736693  0.74020875  0.75767595  0.76439416  0.75364506  0.7361778  0.70258701  0.67033976  0.64077979  0.5964399  0.41908023  0.41101843  0.40430024  0.40833116  0.4217675  0.42579839  0.42714202  0.42445475  0.42848566  0.41370568  0.40967479  0.41908023  0.42848566  0.4298293  0.43117294  0.43117294  0.38548937  0.36264759  0.35592943  0.37070939  0.39892572  0.38952029  0.36533487  0.35996032  0.3747403  0.40430024  0.59912717  0.58165991  0.58300358  0.57897264  0.59106535  0.6354053  0.64884162  0.64212346  0.41236204  0.48894918  0.49701098  0.53732002  0.53866363  0.54806906  0.53597635  0.53597635  0.50507277  0.48088738  0.41773659  0  1  0  1];
face3_X = [0.4372732  0.44735384  0.46751511  0.48868448  0.51086187  0.54311997  0.57840222  0.6157006  0.64191025  0.66811997  0.69029737  0.70743448  0.71449095  0.69231349  0.67618448  0.65703124  0.64090222  0.62779737  0.64090222  0.65703124  0.67316025  0.47860384  0.48566028  0.50380546  0.51993448  0.53001511  0.51691025  0.50481349  0.48969254  0.61771673  0.65501511  0.67618448  0.69029737  0.70541835  0.53606349  0.50380546  0.47860384  0.46045867  0.45037803  0.50582159  0.5622732  0.5844506  0.60158771  0.6560232  0.62074095  0.58646673  0.5542087  0.56328124  0.55723286  0.54311997  0.54211187  0.54916835  0.58344257  0.6157006  0.62779737  0.62578124  0.61368448  0.60461187  0  0  1  1];
face3_Y = [0.62868714  0.66899616  0.70930517  0.74289602  0.76976866  0.80067223  0.81276494  0.80739045  0.77514321  0.7469269  0.7079615  0.66496521  0.6354053  0.46745104  0.45401472  0.44326562  0.45132744  0.46073288  0.4661074  0.46879467  0.47013831  0.46476379  0.45132744  0.44595289  0.44864017  0.46207651  0.4661074  0.4661074  0.46745104  0.40833116  0.39355117  0.39220753  0.40430024  0.43654746  0.41236204  0.39758208  0.39892572  0.41101843  0.44460928  0.64481074  0.61928171  0.62331259  0.62196892  0.64749801  0.70930517  0.71736693  0.70930517  0.47685647  0.53463274  0.54538178  0.56687993  0.58031631  0.58972174  0.58165991  0.5682236  0.55075634  0.54000729  0.47551286  0  1  0  1];
face4_X = [0.42517641  0.43122479  0.44332156  0.47860384  0.50985384  0.54211187  0.58243448  0.62376511  0.65501511  0.6872732  0.71549898  0.72255546  0.73061997  0.69231349  0.6782006  0.65703124  0.64493448  0.63283771  0.6479587  0.66408771  0.6782006  0.48969254  0.50582159  0.52094257  0.53404737  0.54916835  0.53505546  0.51791835  0.50481349  0.62981349  0.64896673  0.69533771  0.71146673  0.71549898  0.56025708  0.55219257  0.50279737  0.47860384  0.47154737  0.50078124  0.57336187  0.58243448  0.59553933  0.65098286  0.60864413  0.58243448  0.5622732  0.57336187  0.56328124  0.544128  0.54211187  0.56630546  0.58142638  0.60461187  0.62376511  0.62779737  0.61267638  0.6167087  0  0  1  1];
face4_Y = [0.63674891  0.68646336  0.73752147  0.78723592  0.8194831  0.83829403  0.8463558  0.83829403  0.81007773  0.77111232  0.71736693  0.66093433  0.60315806  0.56016177  0.54672545  0.54000729  0.54672545  0.55747449  0.56419271  0.57091087  0.56553632  0.51716548  0.50641644  0.51179093  0.51850915  0.53866363  0.5413509  0.54000729  0.52925819  0.52522731  0.49432373  0.50238556  0.51716548  0.53732002  0.50372916  0.47820011  0.46207651  0.46879467  0.48626193  0.68646336  0.70124334  0.7079615  0.70393062  0.70930517  0.75095779  0.74827051  0.74961418  0.5521  0.60315806  0.61793804  0.64749801  0.65421617  0.66630888  0.65959072  0.66227794  0.63003075  0.61390716  0.55881816  0  1  0  1];
face5_X = [0.39795867  0.40501511  0.42316028  0.44231352  0.4796119  0.51590222  0.56025708  0.60461187  0.62981349  0.65904737  0.68626511  0.70340222  0.71449095  0.66610384  0.64392638  0.62275708  0.60763609  0.58949095  0.60763609  0.62880546  0.64493448  0.43021673  0.44634578  0.46751511  0.48666835  0.50380546  0.48767641  0.46751511  0.44936997  0.57134575  0.59654737  0.63182962  0.66005546  0.68828124  0.50582159  0.47154737  0.44029737  0.41811997  0.40400705  0.46348286  0.53404737  0.54614413  0.56025708  0.64493448  0.5844506  0.55723286  0.52699095  0.5219506  0.51489413  0.50380546  0.50380546  0.5219506  0.544128  0.5622732  0.58747482  0.58848286  0.57336187  0.56731349  0  0  1  1];
face5_Y = [0.67840159  0.71333605  0.75498867  0.78589231  0.82620132  0.84904307  0.85979217  0.85173035  0.8194831  0.78857952  0.75364506  0.7079615  0.64481074  0.49298009  0.47820011  0.47282559  0.47954375  0.49298009  0.49969825  0.49969825  0.49835461  0.51179093  0.48894918  0.48088738  0.48894918  0.50507277  0.51179093  0.51850915  0.51985276  0.44326562  0.41236204  0.40698752  0.41504931  0.46476379  0.44729653  0.41773659  0.41773659  0.43520382  0.47551286  0.68511975  0.6636216  0.66765249  0.6636216  0.6636216  0.73752147  0.74155235  0.74289602  0.49701098  0.56284904  0.58300358  0.61659443  0.62062532  0.63406163  0.62196892  0.61121988  0.58031631  0.56419271  0.49835461  0  1  0  1];
face6_X = [0.34957156  0.37275705  0.39896673  0.42215222  0.4483619  0.48767641  0.5310232  0.57941025  0.60461187  0.63283771  0.65501511  0.67114413  0.68122482  0.6167087  0.60763609  0.58747482  0.56529737  0.54916835  0.56731349  0.58142638  0.60057962  0.39896673  0.41207156  0.42920867  0.44231352  0.46247479  0.44432965  0.43324092  0.4171119  0.53505546  0.55824095  0.57941025  0.60360384  0.63586187  0.46146673  0.43122479  0.41106352  0.38384578  0.37174898  0.44029737  0.4907006  0.51489413  0.53908771  0.59150708  0.55219257  0.52699095  0.50279737  0.48162803  0.48364416  0.46449092  0.46045867  0.48666835  0.51489413  0.53908771  0.55924898  0.5542087  0.53807962  0.52699095  0  0  1  1];
face6_Y = [0.65555978  0.69989973  0.72945964  0.76170689  0.7912668  0.8194831  0.82754493  0.80470318  0.76036322  0.70930517  0.67571431  0.63674891  0.59240901  0.46207651  0.44057837  0.43117294  0.43117294  0.44998381  0.4580456  0.46207651  0.46342015  0.47148195  0.45535833  0.44460928  0.44729653  0.45938924  0.46879467  0.47282559  0.47551286  0.40698752  0.38683301  0.37339666  0.37339666  0.43520382  0.41236204  0.39623845  0.39220753  0.40967479  0.4580456  0.65690345  0.63003075  0.6354053  0.62331259  0.63271803  0.7079615  0.71602333  0.71467972  0.47820011  0.53194547  0.5413509  0.58031631  0.58837807  0.5964399  0.58569086  0.57225448  0.52657092  0.52388364  0.47148195  0  1  0  1];
face7_X = [0.3546119  0.35965222  0.37880543  0.39896673  0.43424898  0.47154737  0.50279737  0.53505546  0.57235384  0.606628  0.62578124  0.64090222  0.6479587  0.60259575  0.58848286  0.57033771  0.55219257  0.53707159  0.55924898  0.575378  0.59049898  0.39291835  0.4060232  0.42618448  0.44432965  0.45642641  0.44130543  0.42215222  0.40703124  0.53404737  0.55924898  0.59755546  0.61771673  0.63082159  0.45642641  0.43122479  0.39997479  0.38082156  0.37174898  0.42013609  0.48061997  0.4997732  0.52598286  0.575378  0.53303933  0.50682962  0.47759578  0.4796119  0.47255543  0.45642641  0.45037803  0.47154737  0.49876511  0.52094257  0.54110384  0.54211187  0.5229587  0.51892638  0  0  1  1];
face7_Y = [0.66496521  0.72005421  0.77514321  0.81545222  0.85576123  0.86785394  0.86651033  0.86113578  0.8409813  0.81545222  0.76842505  0.72542876  0.65959072  0.48626193  0.46476379  0.45535833  0.46476379  0.4849183  0.48894918  0.48760554  0.48760554  0.48357466  0.46342015  0.45267108  0.4661074  0.48088738  0.48357466  0.48760554  0.48760554  0.43520382  0.41504931  0.41236204  0.42714202  0.45132744  0.42311114  0.40698752  0.40698752  0.41908023  0.44460928  0.67840159  0.6636216  0.66765249  0.65690345  0.67571431  0.72945964  0.73886508  0.72945964  0.49029282  0.55613089  0.57359815  0.60853261  0.61256349  0.62868714  0.61256349  0.607189  0.57762903  0.55747449  0.49298009  0  1  0  1];

% Calc average face Points
X_av = (face1_X*(1/7)+face2_X*(1/7)+face3_X*(1/7)+face4_X*(1/7)+face5_X*(1/7)+face6_X*(1/7)+face7_X*(1/7));
Y_av = (face1_Y*(1/7)+face2_Y*(1/7)+face3_Y*(1/7)+face4_Y*(1/7)+face5_Y*(1/7)+face6_Y*(1/7)+face7_Y*(1/7));

% Make triangles for average face
tri = delaunay(X_av,Y_av);

for iTriangle = 1 : length(tri)
    
    % Estimate the transformation between each face and average face.
    img1_X_Vals = [face1_X(tri(iTriangle,1))*640, face1_X(tri(iTriangle,2))*640, face1_X(tri(iTriangle,3))*640];
    img1_Y_Vals = [face1_Y(tri(iTriangle,1))*480, face1_Y(tri(iTriangle,2))*480, face1_Y(tri(iTriangle,3))*480];
    img2_X_Vals = [face2_X(tri(iTriangle,1))*640, face2_X(tri(iTriangle,2))*640, face2_X(tri(iTriangle,3))*640];
    img2_Y_Vals = [face2_Y(tri(iTriangle,1))*480, face2_Y(tri(iTriangle,2))*480, face2_Y(tri(iTriangle,3))*480];
    img3_X_Vals = [face3_X(tri(iTriangle,1))*640, face3_X(tri(iTriangle,2))*640, face3_X(tri(iTriangle,3))*640];
    img3_Y_Vals = [face3_Y(tri(iTriangle,1))*480, face3_Y(tri(iTriangle,2))*480, face3_Y(tri(iTriangle,3))*480];
    img4_X_Vals = [face4_X(tri(iTriangle,1))*640, face4_X(tri(iTriangle,2))*640, face4_X(tri(iTriangle,3))*640];
    img4_Y_Vals = [face4_Y(tri(iTriangle,1))*480, face4_Y(tri(iTriangle,2))*480, face4_Y(tri(iTriangle,3))*480];
    img5_X_Vals = [face5_X(tri(iTriangle,1))*640, face5_X(tri(iTriangle,2))*640, face5_X(tri(iTriangle,3))*640];
    img5_Y_Vals = [face5_Y(tri(iTriangle,1))*480, face5_Y(tri(iTriangle,2))*480, face5_Y(tri(iTriangle,3))*480];
    img6_X_Vals = [face6_X(tri(iTriangle,1))*640, face6_X(tri(iTriangle,2))*640, face6_X(tri(iTriangle,3))*640];
    img6_Y_Vals = [face6_Y(tri(iTriangle,1))*480, face6_Y(tri(iTriangle,2))*480, face6_Y(tri(iTriangle,3))*480];
    img7_X_Vals = [face7_X(tri(iTriangle,1))*640, face7_X(tri(iTriangle,2))*640, face7_X(tri(iTriangle,3))*640];
    img7_Y_Vals = [face7_Y(tri(iTriangle,1))*480, face7_Y(tri(iTriangle,2))*480, face7_Y(tri(iTriangle,3))*480];
    target_X_Vals = [X_av(tri(iTriangle,1))*640, X_av(tri(iTriangle,2))*640, X_av(tri(iTriangle,3))*640]
    target_Y_Vals = [Y_av(tri(iTriangle,1))*480, Y_av(tri(iTriangle,2))*480, Y_av(tri(iTriangle,3))*480]
    
    
    A = estimateAffineBetweenShapes(img1_X_Vals, img1_Y_Vals, target_X_Vals, target_Y_Vals);
    B = estimateAffineBetweenShapes(img2_X_Vals, img2_Y_Vals, target_X_Vals, target_Y_Vals);
    C = estimateAffineBetweenShapes(img3_X_Vals, img3_Y_Vals, target_X_Vals, target_Y_Vals);
    D = estimateAffineBetweenShapes(img4_X_Vals, img4_Y_Vals, target_X_Vals, target_Y_Vals);
    E = estimateAffineBetweenShapes(img5_X_Vals, img5_Y_Vals, target_X_Vals, target_Y_Vals);
    F = estimateAffineBetweenShapes(img6_X_Vals, img6_Y_Vals, target_X_Vals, target_Y_Vals);
    G = estimateAffineBetweenShapes(img7_X_Vals, img7_Y_Vals, target_X_Vals, target_Y_Vals);
    
    % Convert our transformation matrix to matlab's own transformation format.
    % Matlab functions that construct tforms expect the input matrix in
    % transpose form.
    tform1 = affine2d(A');
    tform2 = affine2d(B');
    tform3 = affine2d(C');
    tform4 = affine2d(D');
    tform5 = affine2d(E');
    tform6 = affine2d(F');
    tform7 = affine2d(G');
    
    % This step applies the estimated affine warp to the source image. We
    % use "OutputView" to force the dimension of the transformed image to
    % be equal to that of the final destination image so we can just add
    % all the warps together (We can only add matrices of the same size).
    J = imwarp(im1,tform1,'OutputView',imref2d(size(finalImage)));
    K = imwarp(im2,tform2,'OutputView',imref2d(size(finalImage)));
    L = imwarp(im3,tform3,'OutputView',imref2d(size(finalImage)));
    M = imwarp(im4,tform4,'OutputView',imref2d(size(finalImage)));
    N = imwarp(im5,tform5,'OutputView',imref2d(size(finalImage)));
    O = imwarp(im6,tform6,'OutputView',imref2d(size(finalImage)));
    P = imwarp(im7,tform7,'OutputView',imref2d(size(finalImage)));
    
    
    % Calculate a binary mask of the region of interest - ROI (1=inside
    % region, 0=outside region). The ROI is created from the triangle
    % coordinates.
    BW1 = roipoly(J,target_X_Vals,target_Y_Vals);
    BW2 = roipoly(K,target_X_Vals,target_Y_Vals);
    BW3 = roipoly(L,target_X_Vals,target_Y_Vals);
    BW4 = roipoly(M,target_X_Vals,target_Y_Vals);
    BW5 = roipoly(N,target_X_Vals,target_Y_Vals);
    BW6 = roipoly(O,target_X_Vals,target_Y_Vals);
    BW7 = roipoly(P,target_X_Vals,target_Y_Vals);
    
    % Create a 3-D mask (RGB). The original BW mask produced by the
    % previous step is 2-D. To mask a color image (i.e., RGB), we need a
    % 3-D mask.
    BW1_3 = false(size(J,1),size(J,2),3);   % We need a logical matrix
    BW1_3(:,:,1) = BW1;  % Red component
    BW1_3(:,:,2) = BW1;  % Green component
    BW1_3(:,:,3) = BW1;  % Blue component
    
    BW2_3 = false(size(K,1),size(K,2),3);   % We need a logical matrix
    BW2_3(:,:,1) = BW2;  % Red component
    BW2_3(:,:,2) = BW2;  % Green component
    BW2_3(:,:,3) = BW2;  % Blue component
    
    BW3_3 = false(size(L,1),size(L,2),3);   % We need a logical matrix
    BW3_3(:,:,1) = BW3;  % Red component
    BW3_3(:,:,2) = BW3;  % Green component
    BW3_3(:,:,3) = BW3;  % Blue component
    
    BW4_3 = false(size(M,1),size(M,2),3);   % We need a logical matrix
    BW4_3(:,:,1) = BW4;  % Red component
    BW4_3(:,:,2) = BW4;  % Green component
    BW4_3(:,:,3) = BW4;  % Blue component
    
    BW5_3 = false(size(N,1),size(N,2),3);   % We need a logical matrix
    BW5_3(:,:,1) = BW5;  % Red component
    BW5_3(:,:,2) = BW5;  % Green component
    BW5_3(:,:,3) = BW5;  % Blue component
    
    BW6_3 = false(size(O,1),size(O,2),3);   % We need a logical matrix
    BW6_3(:,:,1) = BW6;  % Red component
    BW6_3(:,:,2) = BW6;  % Green component
    BW6_3(:,:,3) = BW6;  % Blue component
    
    BW7_3 = false(size(P,1),size(P,2),3);   % We need a logical matrix
    BW7_3(:,:,1) = BW7;  % Red component
    BW7_3(:,:,2) = BW7;  % Green component
    BW7_3(:,:,3) = BW7;  % Blue component
    
    % RGB image for storing the extracted warped region
    Imasked1 = zeros(size(J),class(J));
    Imasked2 = zeros(size(K),class(K));
    Imasked3 = zeros(size(L),class(L));
    Imasked4 = zeros(size(M),class(M));
    Imasked5 = zeros(size(N),class(N));
    Imasked6 = zeros(size(O),class(O));
    Imasked7 = zeros(size(P),class(P));
    
    % Use the 3-D mask to get the pixel values from the RGB image
    Imasked1(BW1_3) = J(BW1_3);   % Mask works as indices for the pixels
    Imasked2(BW2_3) = K(BW2_3);   % Mask works as indices for the pixels
    Imasked3(BW3_3) = K(BW3_3);   % Mask works as indices for the pixels
    Imasked4(BW4_3) = K(BW4_3);   % Mask works as indices for the pixels
    Imasked5(BW5_3) = K(BW5_3);   % Mask works as indices for the pixels
    Imasked6(BW6_3) = K(BW6_3);   % Mask works as indices for the pixels
    Imasked7(BW7_3) = K(BW7_3);   % Mask works as indices for the pixels
    
    final_mask = Imasked1*(1/7)+Imasked2*(1/7)+Imasked3*(1/7)+Imasked4*(1/7)+Imasked5*(1/7)+Imasked6*(1/7)+Imasked7*(1/7);
    
    
    
    % Increamentally add all warped triangles to form a single image with
    % all warped triangular regions.
    finalImage = finalImage + final_mask;
    
    snapnow;
    drawnow;
    
    
end

% merge two faces together% Show the region


% Show the region
figure;
imshow(finalImage);
title( 'Final Image' );
drawnow;
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

M

% Vector b in the least-squares equation
b = [ x2'; y2' ]

% Least-squares solution using matlab's \ operator
a = M \ b

%%
% We re-construct the affine transformation matrix using the estimated
% values.
A = [ a(1) a(2)  a(3); ...
    a(4) a(5)  a(6); ...
    0.0  0.0  1.0]


return

function drawTriangle(x, y, c)
%
% Plot selected polygon as a dashed line for visualization
hold on;
%plot(  tri(1).x, tri(1).y,'r+','LineWidth',2,'MarkerSize',10);
plot(  x, y,'o','LineWidth',2,'MarkerSize',10);
patch( x, y,'o','EdgeColor','k','LineWidth',4,'MarkerSize',10,'FaceColor',c,'FaceAlpha',.2);
drawnow;

% Display corner labels
for i = 1 : length( x )
    text( x(i)+20, y(i), ...
        sprintf( '%d', i ), 'Color', 'c', 'FontSize', 16,'FontWeight', 'bold' );
end

% Force drawing now
drawnow;
axis on;


return