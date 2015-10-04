# intellij

docker run -it --name intellij -v /home/juliens:/home/intellij/juliens -v /home/juliens/.m2:/home/intellij/.m2 -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix:/tmp/.X11-unix juliens/intellij /home/intellij/idea-IC-139.1117.1/bin/idea.sh
