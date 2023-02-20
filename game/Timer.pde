class Timer
{
    float Time;

    float getTime()
    {
        return (Time);
    }

    void setTime(float set)
    {
        Time = set;
    }

    void countDown()
    {
        Time -= 1/frameRate;
    }

    void countUp(float add)
    {
        Time += add;
    }

}
