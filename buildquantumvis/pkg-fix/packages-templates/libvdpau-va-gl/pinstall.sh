#!/bin/sh

#170512 pyro64
mkdir -p etc/profile.d
echo '#this is suppposed to help libvdpau find libvdpau-va-gl.so ...
export VDPAU_DRIVER=va_gl' > etc/profile.d/vdpau_gl
