﻿using Sledge.DataStructures.Geometric;
using Sledge.Graphics;

namespace Sledge.Gui.Viewports
{
    public interface IViewport3D : IViewport
    {
        ViewType Type { get; set; }
        Camera Camera { get; }
        void FocusOn(Coordinate coordinate, Coordinate distance);
        Line CastRayFromScreen(int x, int y);
    }
}