#!/bin/bash
mvn package
scp -r target/alura-forum.war caelum@192.168.0.223:/home/caelum
