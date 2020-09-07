function [ myhandles ] = make_spaceship(trf_root, transparency)
% Makes a space-ship with the root transform as the given transform.
% The surfaces are drawn with the given transparency in [0,1]
% A vector of handles to all the surfaces is returned.

ship_dish_profile= 1.75*sin(linspace(1, pi, 15));
[Xc, Yc, Zc]= cylinder(ship_dish_profile);

% Top dish
trf_top_root= hgtransform('Parent', trf_root);
set(trf_top_root, 'Matrix', makehgtform('translate', [0.75, 0, -0.2]));
%set(trf_top_root,'Matrix', makehgtform('yrotate',-6.6));
color_top= [0.2, 0.5, 0.3];
myhandles(1)= surface(Xc, Yc, Zc, 'Parent', trf_top_root, 'FaceColor', color_top, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_top, 'EdgeAlpha', transparency);

% Bottom dish
trf_bottom_root= hgtransform('Parent', trf_root);
set(trf_bottom_root, 'Matrix', makehgtform('translate', [0.75, 0, 0.2]));
%set(trf_bottom_root, 'Matrix', makehgtform('yrotate', -pi));
color_bottom= [1, 0.5, 0.1];
myhandles(2)= surface(Xc, Yc, Zc, 'Parent', trf_bottom_root, 'FaceColor', color_bottom, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_bottom, 'EdgeAlpha', transparency);

% creates x, y, z coordinates of unit cylinder to draw left tail
[Xt, Yt, Zt]= cylinder([0.4 , 0.4 , 0.2]);
%0.4,0.5,1

% Vertical 1
trf_tailleft_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [0.65,0.65,1.6]);
trf_Ry= makehgtform('yrotate', -6.6);
trf_T= makehgtform('translate', [0, 0.5, 0.88]);
% Interpret the order as BFT (left to right)
set(trf_tailleft_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_tail_left= [0.5 1 1]; 
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_tailleft_root, 'FaceColor', color_tail_left, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_left, 'EdgeAlpha', transparency);

%Vertical 2
trf_tailleft_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [0.65,0.65,1.6]);
trf_Ry= makehgtform('yrotate', -6.6);
trf_T= makehgtform('translate', [0, -0.5, 0.88]);
% Interpret the order as BFT (left to right)
set(trf_tailleft_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_tail_left= [0.5 1 1]; 
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_tailleft_root, 'FaceColor', color_tail_left, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_left, 'EdgeAlpha', transparency);
% Your code here. Use left tail as a reference and design spaceship as
% shown in the class. You can come up with a new design.

%Right tail
[Xm, Ym, Zm]= cylinder([0.4 , 0.5 , 1]);
trf_tailwing_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [0.7,0.7,1.5]);
trf_Ry= makehgtform('yrotate', 5.4*pi/4);
trf_T= makehgtform('translate', [0, 0.5, 2.2]);
 %Interpret the order as BFT (left to right)
set(trf_tailwing_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_tail_wing= [1 1 1]; 
myhandles(4)= surface(Xm, Ym, Zm, 'Parent', trf_tailwing_root, 'FaceColor', color_tail_wing, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_wing, 'EdgeAlpha', transparency);

trf_tailwing_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [0.7,0.7,1.5]);
trf_Ry= makehgtform('yrotate', 5.4*pi/4);
trf_T= makehgtform('translate', [0, -0.5, 2.2]);
 %Interpret the order as BFT (left to right)
set(trf_tailwing_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_tail_wing= [1 1 1]; 
myhandles(4)= surface(Xm, Ym, Zm, 'Parent', trf_tailwing_root, 'FaceColor', color_tail_wing, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_wing, 'EdgeAlpha', transparency);


%connectors
[Xr, Yr, Zr]= cylinder([0.4 , 0.3 , 0]);
trf_tail_link_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1.5,1.5]);
trf_Ry= makehgtform('yrotate',1.1);
trf_T= makehgtform('translate', [-0.5, 0.5, 2]);
 %Interpret the order as BFT (left to right)
set(trf_tail_link_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_tail_link= [0.3 0.4 1]; 
myhandles(4)= surface(Xr, Yr, Zr, 'Parent', trf_tail_link_root, 'FaceColor', color_tail_link, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_link, 'EdgeAlpha', transparency);

trf_tail_link_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1.5,1.5]);
trf_Ry= makehgtform('yrotate',1.1);
trf_T= makehgtform('translate', [-0.5, -0.5, 2]);
 %Interpret the order as BFT (left to right)
set(trf_tail_link_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_tail_link= [0.3 0.4 1]; 
myhandles(4)= surface(Xr, Yr, Zr, 'Parent', trf_tail_link_root, 'FaceColor', color_tail_link, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_link, 'EdgeAlpha', transparency);


%Adding a new base structure
trf_top_root= hgtransform('Parent', trf_root);
set(trf_top_root, 'Matrix', makehgtform('translate', [0.75, 0, -0.1]));
color_top= [0.8, 0.1, 0.6];
myhandles(1)= surface(Xc, Yc, Zc, 'Parent', trf_top_root, 'FaceColor', color_top, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_top, 'EdgeAlpha', transparency);


end


