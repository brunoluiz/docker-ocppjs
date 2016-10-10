# Docker OCPPJS Image

GIR OCPPJS Docker Image (the source of the gir-ocppjs is available on http://www.gir.fr/ocppjs/)

## How to use
After installing the image, just run ```docker run -p 9000:9000 -t -i brunoluiz/ocppjs node ocppjs COMMAND+ARGUMENTS```.

Examples:
  - WS Server: ```docker run -p 9000:9000 -t -i brunoluiz/ocppjs node ocppjs start_cs 9000```
  - WS Client: ```docker run -p 9000:9000 -t -i brunoluiz/ocppjs node ocppjs start_cp ws://localhost:9000 0```
  - SOAP 1.2 Server: ```docker run -p 9000:9000 -t -i brunoluiz/ocppjs node ocppjs start_cs 9000 -t soap```
  - SOAP 1.2 Client: ```docker run -p 9000:9000 -t -i brunoluiz/ocppjs node ocppjs start_cp http://localhost:9000 boxid -t soap -f http://localhost:9001```

## Modifications from the original OCPPJS
The OCPPJS used by this Docker image is the one in the gir-ocppjs-1.0.2 folder, not the one from the zip file. The folder one contains a modified version, where it uses a SOAP 1.2 implementation instead of using the 1.1.

If you want the original implementation, just modify the Dockerfile to download the zip file (use wget for this) instead of clone this repo.
