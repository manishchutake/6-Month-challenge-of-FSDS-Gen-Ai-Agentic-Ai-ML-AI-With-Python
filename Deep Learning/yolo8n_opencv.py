import random
import cv2
import numpy as np
from ultralytics import YOLO

#Load a COCO-pretrainedYOLO8n model
#model = yolo(yolo8n)

#display the information(optional)
#model.info

# train the model on the coco example dataset for 100 epochs
#results  = model.train (data = coco8yaml, epochs= 100, igsmz = 640)

#opening the file in read mode

my_file = open(r"")
data = my_file.read()

#replacing end splitting the text when newline("\n")is seen

class_list = data.split("\n")
my_file.close()

#print(class_list)


#generate random colors for class list

detection_colors = []
for i in range (len(class_list)):
    r = random.randint(0, 255)
    g = random.randint(0, 255)
    b = random.randint(0, 255)
    detection_colors.append((b,g,r))
    
    
# load pretrained yolo 8n model
model = YOLO("weights/yolov8n.pt","v8")


#vals to realise the video frame small frame optimize the run
frame_wid = 640
frame_hyt = 480


# cap = cv2.videocapture(1)Q
cap = cv2.VideoCapture(r"")

if not cap.isOpened():
    print("Cannot open camera")
    exit()
    
    
while True:
    
    #capture frame-by-frame
    ret,frame = cap.read()
    
    # if frame is read correctly et is true
    
    if not ret:
        print("Cant receive frame(stream end?). Exitting...")
        break
    
    
# resize the frame small frame optimizethe run
#frame = cv2.resize(frame,(frame_wid,frame_hyt))


# predict on Image 
detect_params = model.predict(source = [frame], conf = 0.45, save = True)


# convert tensor array to numpy
DP = detect_params[0].numpy()
print(DP)


if len(DP) ! = 0:
    for i in range (len(detect_params[0])):
        print(i)
        
        
        boxes = detect_params[0].boxes
        box = boxes[i] # returns one box
        clsID = box.cls.numpy()[0]
        conf = box.conf.numpy()[0]
        bb = box.xyxy.numpy()[0]
        
        
        cv2.rectangle(
            frame,
            (int(bb[0]), int(bb[1])),
            (int(bb[2]), int(bb[3])),
            detection_colors[int(clsID)],
            3,
        )
        
        
        # display class name and confidence
        
        font = cv2.FONT_HERSHEY_COMPLEX
        cv2.putText(
            frame,
            class_list[int(clsID)] + " " + str(round(conf, 3)) + "%
            (int(bb[0])), int(bb[1]) - 10),
            font,
            1,
            (255,255, 255),
            2
        )
    # Display the resulting frame
    
    cv2.imshow("ObjectDetection", frame)
    
    # Turminate run when "Q" pressed
    if cv2.waitkey(1) == ord("q"):
        break
        
# when everything done, release the capture
cap.release()
cv2.destroyAllWindows()
