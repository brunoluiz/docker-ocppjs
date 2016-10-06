# Docker OCPPJS Image

GIR OCPPJS Docker Image (the source of the gir-ocppjs is available on http://www.gir.fr/ocppjs/)

## How to use
After installing the image, just run ```docker run -p 9000:9000 -t -i brunoluiz/ocppjs node ocppjs start_cs 9000```

## Known Problems
The GIR-OCPPJS still gives problems for SOAP implementation, due to node-expat compilation problems (if you solve it, just send me a pull request).
