FROM python:3.6

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		build-essential apt-utils pkg-config software-properties-common \
	    libcairo2-dev libpango1.0-dev libglib2.0-dev libgtk2.0-dev \
	    libgflags-dev libgoogle-glog-dev \
	    libjpeg62-turbo-dev libtiff5-dev libpng-dev \
		libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
		libatlas-base-dev libhdf5-serial-dev \
		libgstreamer1.0-0 gstreamer1.0-plugins-base libusb-1.0-0-dev libdrm-dev \
		libxi-dev libglu1-mesa-dev libglew-dev ffmpeg \
	    && apt-get clean \
		&& rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip \
    && pip3 install -r requirements.txt