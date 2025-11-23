from ultralytics import YOLO
import numpy

# load pretrained yolo 11n model
model = YOLO("yolov8n.pt", "v8")

#predict an image
detection_output = model.predict(source = r"/Users/manishuxuid/Desktop/FSDS/FSDS Notes/November Classes notes/18 nov/yolo/a man working.jpg", conf = 0.25, save = True )

#display tensor array

print(detection_output)