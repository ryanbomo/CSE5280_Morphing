function A = main()


raw_X_1 = [ 0.34049898  0.34856352  0.35864416  0.38787803  0.42416835  0.45753528  0.49775705  0.54291835  0.57840222  0.60395663  0.62366433  0.63172884  0.63888609  0.59654737  0.58142638  0.56126511  0.54816025  0.5310232  0.54916835  0.56630546  0.58243448  0.38384578  0.39896673  0.4171119  0.43525705  0.45541835  0.43424898  0.41509578  0.39997479  0.51892638  0.5542087  0.58243448  0.60965222  0.62376511  0.45743448  0.42316028  0.38888609  0.36469254  0.35057965  0.43223286  0.47255543  0.49574092  0.51489413  0.55622482  0.51892638  0.50178933  0.47457156  0.47356352  0.46650705  0.4483619  0.45441028  0.47255543  0.49674898  0.51388609  0.53606349  0.54110384  0.53001511  0.51489413  1  0  1  0  0.1625  0.196875  0.35625  0.328125  0.2984375  0.3046875  0.3171875  0.3109375  0.3734375  0.478125  0.590625  0.65  0.6484375  0.659375  0.6671875  0.65625  0.609375  0.784375  0.8203125]
raw_Y_1 = [0.6246562  0.66899616  0.71333605  0.78186136  0.82351404  0.84144946  0.85038674  0.83963764  0.80396345  0.76170689  0.71736693  0.66630888  0.62062532  0.49298009  0.48223102  0.47820011  0.48760554  0.50104189  0.50910372  0.5131346  0.50776005  0.49701098  0.47954375  0.47551286  0.48626193  0.50238556  0.50776005  0.51447821  0.51044732  0.44729653  0.42042387  0.41370568  0.4217675  0.4580456  0.43520382  0.41908023  0.41370568  0.43117294  0.47551286  0.70124334  0.67571431  0.68377608  0.67705792  0.70124334  0.7361778  0.73752147  0.73349059  0.5131346  0.57762903  0.59778357  0.63137436  0.63674891  0.64481074  0.6354053  0.63003075  0.59509629  0.58300358  0.51179093  1  1  0  0  1  0.9416666667  0.8708333333  0.6604166667  0.5854166667  0.4625  0.4729166667  0.29375  0.1729166667  0.10625  0.1666666667  0.2416666667  0.4625  0.4479166667  0.5375  0.6291666667  0.8770833333  0.9645833333  1]

X_1 = raw_X_1 * [640]
Y_1 = raw_Y_1 *[480]

raw_X_2 = [0.41307965 	0.41912803 	0.43424898 	0.45642641 	0.47356352 	0.50279737 	0.54009575 	0.58041835 	0.606628 	0.62981349 	0.64594257 	0.65400708 	0.6560232 	0.62880546 	0.62174898 	0.60360384 	0.5844506 	0.56832159 	0.58041835 	0.60057962 	0.61872482 	0.43828124 	0.45138609 	0.46650705 	0.48263609 	0.50481349 	0.48566028 	0.4685232 	0.45340222 	0.55824095 	0.58646673 	0.60864413 	0.62779737 	0.64392638 	0.4997732 	0.47557965 	0.44735384 	0.43122479 	0.42013609 	0.4796119 	0.52699095 	0.544128 	0.55824095 	0.59856349 	0.56529737 	0.54513609 	0.51892638 	0.51993448 	0.51186997 	0.50178933 	0.50582159 	0.5229587 	0.54110384 	0.55723286 	0.57436997 	0.57638609 	0.56428933 	0.55521673 	1 	               0 	        1 	        0 	        0.1046875    0.184375       0.41875         0.375           0.359375        0.3546875 0.375           0.359375          0.403125        0.5078125       0.61875    0.665625        0.665625 0.675           0.678125    0.6796875    0.6234375    0.8015625    0.9171875]
raw_Y_2 = [0.62868714 	0.68243247 	0.72811604 	0.76036322 	0.78857952 	0.82485765 	0.83291948 	0.81410861 	0.77648687 	0.74155235 	0.70258701 	0.6528725 	0.61659443 	0.50776005 	0.49969825 	0.49029282 	0.49566737 	0.50910372 	0.51447821 	0.51716548 	0.51582187 	0.51850915 	0.50776005 	0.49835461 	0.50507277 	0.51582187 	0.52388364 	0.53060186 	0.52791458 	0.46073288 	0.4378911 	0.4378911 	0.44057837 	0.46073288 	0.46073288 	0.44595289 	0.44998381 	0.46207651 	0.48626193 	0.69318151 	0.66765249 	0.67437065 	0.67033976 	0.68108886 	0.72408509 	0.72542876 	0.72408509 	0.51582187 	0.58300358 	0.607189 	0.63271803 	0.63406163 	0.63809258 	0.63271803 	0.62734348 	0.59912717 	0.58300358 	0.51985276 	1                  1    	    0 	        0 	        1            0.9104166667   0.8104166667    0.6145833333    0.5479166667    0.4875    0.4979166667    0.3458333333      0.1895833333    0.1541666667    0.18125    0.2854166667    0.475    0.4604166667    0.5         0.59375      0.825        0.88125      1]

X_2 = raw_X_2 * [640]
Y_2 = raw_Y_2 *[480]

% assign triangles based on 50-50 face
X_av = (X_2*(.5)+ X_1*(.5))
Y_av = (Y_2*(.5)+ Y_1*(.5))

tri_av = delaunay(X_av,Y_av);



% Get Photos
img_1 = imread('img/23-5m.jpg'); 
% figure; 
% set(gcf, 'color','w'); 
% set(gcf, 'Position', [0, 0, 100, 100])
% imshow(img_1); 
% title('Source image and triangulation'); 
% drawnow;
% hold on;
% % Obtain triangulation 
% triplot(tri_av,X_1,Y_1);
% hold off;





img_2 = imread('img/13-5m.jpg');
transpose = 0
current_time = 1
while transpose<=1
    morphed_im = morph(img_1, img_2, raw_X_1, raw_Y_1, raw_X_2, raw_Y_2, tri_av, transpose, transpose);
    transpose = transpose + (1/44)
    
    
    % Write things to gif
    im{current_time} = morphed_im;
    filename = 'testAnimated.gif';
    [A,map] = rgb2ind(im{current_time},256);
    delay_time = 1/30;
    if current_time == 1
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',delay_time);
    else
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',delay_time);
    end
    
    current_time = current_time + 1;
    
    
    
end

% IMG 2 Test 
% figure; 
% set(gcf, 'color','w'); 
% set(gcf, 'Position', [0, 0, 100, 100])
% imshow(img_2); 
% title('Source image and triangulation'); 
% drawnow;
% hold on;
% triplot(tri_av,X_2,Y_2);
% hold off;

return

