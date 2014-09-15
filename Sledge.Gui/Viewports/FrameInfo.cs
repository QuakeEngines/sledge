namespace Sledge.Gui.Viewports
{
    public class FrameInfo
    {
        public long Milliseconds { get; private set; }

        public FrameInfo(long milliseconds)
        {
            Milliseconds = milliseconds;
        }
    }
}