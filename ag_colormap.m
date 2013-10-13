function [ cmap ] = ag_colormap(type )
%AG_COLORMAP Constant luminance colourmaps, set type to pick different ones

if (nargin > 0)
    % I cannot spell for candy
    if (strcmpi(type, 'gray') || strcmpi(type, 'grey'))
        cmap = ag_gray();
        return;
    end
    if (strcmpi(type, 'half'))
        cmap = ag_half_rainbow();
    end
end

cmap = ag_rainbow();
end

% __device__ uchar3 colorize(uchar v) {
%   float val = (float)v/255.0f * pi;
%   float r = __sinf(val); 
%   float g = __sinf(fmaf(pi, 2.0/3.0, val)); 
%   float b = __sinf(fmaf(pi, 4.0/3.0, val)); 
%   return make_uchar3(r*r*255, g*g*255, b*b*255);
% }
function cmap = ag_rainbow()
    for k = 0:255
        val = k/255.0 * pi;
        r = sin(val);
        g = sin(val + 2*pi/3);
        b = sin(val + 4*pi/3);    
        cmap(k+1,:) = [r*r, g*g, b*b];
    end
end

function cmap = ag_half_rainbow()
    for k = 0:255
        val = 0.5*k/255.0 * pi;
        r = sin(val);
        g = sin(val + 0.5*2*pi/3);
        b = sin(val + 0.5*4*pi/3);    
        cmap(k+1,:) = [r*r, g*g, b*b];
    end
end

function cmap = ag_gray()
    for k = 0:255;
        cmap(k+1, :) = 0.9*[k/255.0 k/255.0 k/255.0] + 0.05;
    end
end
