for(c = 0; c < Circles; c += 1)
{
    //CircleX[c] = room_width/2
    //CircleY[c] = room_width/2
    //CircleSize[c] = InitCircleSize

    for(l = 0; l < LeavesPerCircle; l += 1)
    {
        LeafCircleDistance[l] = CircleSize[c] - cos(LeafConst[l]/100 + LeafRand[l])*(InitCircleSize - InitCircleSize/10);
        if l mod 2
            LeafCircleAngle[l] = l/LeavesPerCircle * 360 + LeafConst[l]*CircleSpeed;
        else
            LeafCircleAngle[l] = l/LeavesPerCircle * 360 - LeafConst[l]*CircleSpeed;
        LeafSize[l] = sqrt(((LeafCircleDistance[l] - InitCircleSize/20)/CircleSize[c])/2) * LeafImageScale
        //LeafAngle[l] = point_direction(LeafX[l],LeafY[l],room_width/2,room_height/2);
        //LeafSize[l] = max(LeafCircleDistance[l]/80,1) + (sin(LeafX[l]/10) + 1)
        //LeafAlpha[l] = 1 + sin(LeafAngle[l])/4 - 1/4
        if LeafFocus[l] < 1
            LeafFocus[l] += 0.02
            
        //if LeafVSpeed[l] > 0
        //    LeafVSpeed[l] -= 0.01
        LeafVSpeed[l] +=  LeafSize[l]/2// * 1-LeafFocus[l]
        //freedo whatever
        if LeafFocus[l] < 1
        {    
            LeafX[l] += LeafHSpeed[l];
            LeafY[l] += LeafVSpeed[l];
            LeafCenterX[l] = LeafX[l]
            LeafCenterY[l] = LeafY[l]
                
        }
        //follow path
        else
        {
        
            if  LeafCenterX[l] != CircleX[c] or LeafCenterY[l] != CircleY[c]
            {
                //x
                if  LeafCenterX[l] < CircleX[c]
                    LeafCenterX[l] = min(LeafCenterX[l] + 10, CircleX[c])
                else if  LeafCenterX[l] > CircleX[c]
                    LeafCenterX[l] = max(LeafCenterX[l] - 10, CircleX[c])

                //y
                if  LeafCenterY[l] < CircleY[c]
                    LeafCenterY[l] = min(LeafCenterY[l] + 10, CircleY[c])
                else if  LeafCenterY[l] > CircleY[c]
                    LeafCenterY[l] = max(LeafCenterY[l] - 10, CircleY[c])
            }
            
            LeafX[l] = LeafCenterX[l] + lengthdir_x(LeafCircleDistance[l], LeafCircleAngle[l]);
            LeafY[l] = LeafCenterY[l] + lengthdir_y(LeafCircleDistance[l], LeafCircleAngle[l]);
            LeafVSpeed[l] = 0
        }
    }
}
