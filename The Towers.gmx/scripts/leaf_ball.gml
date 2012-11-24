for(c = 0; c < Circles; c += 1)
{
    //CircleX[c] = room_width/2
    //CircleY[c] = room_width/2
    //CircleSize[c] = InitCircleSize

    for(l = 0; l < LeavesPerCircle; l += 1)
    {
        LeafCircleDistance[l] = CircleSize[c] + cos(Time/100)*150;
        LeafCircleAngle[l] = l/LeavesPerCircle * 360 + Time*CircleSpeed;
        LeafX[l] = CircleX[c] + lengthdir_x(LeafCircleDistance[l] + cos(degtorad(LeafCircleAngle[l]*10 + Time/2 + l*10)) * LeafCircleDistance[l]*2*sin(Time/10), LeafCircleAngle[l]);
        LeafY[l] = CircleY[c] + lengthdir_y(LeafCircleDistance[l] + cos(degtorad(LeafCircleAngle[l]*10 + Time/2 + l*10)) * LeafCircleDistance[l]*2*sin(Time/10), LeafCircleAngle[l]);
        LeafAngle[l] = point_direction(LeafX[l],LeafY[l],room_width/2,room_height/2);
        LeafSize[l] = max(LeafCircleDistance[l]/80,1) + (sin(LeafX[l]/10) + 1)
        LeafAlpha[l] = 1 + sin(LeafAngle[l])/4 - 1/4
    }
}
