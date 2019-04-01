package com.QuickHit;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
class SketchPanel extends JPanel implements KeyListener
{
    public SketchPanel()
    {
        addKeyListener(this);
    }
    public void keyPressed(KeyEvent evt)
    {
        int keyCode =evt.getKeyCode();
        int d;
        if (evt.isShiftDown())
            d=5;
        else
            d=1;
        if (keyCode==KeyEvent.VK_LEFT) add(-d,0);
        else if (keyCode ==KeyEvent.VK_RIGHT) add(d,0);
        else if (keyCode ==KeyEvent.VK_UP) add(0,-d);
        else if (keyCode ==KeyEvent.VK_DOWN) add(0,d);
//repaint();
    }
    public void keyReleased(KeyEvent evt){}
    public void keyTyped(KeyEvent evt)
    {
        char keyChar =evt.getKeyChar ();
        int d;
        if (Character.isUpperCase(keyChar))
        { d=5;
            keyChar=Character.toLowerCase(keyChar);
        }
        else
            d=1;
        if (keyChar=='h') add(-d,0);
        else if (keyChar=='1') add(d,0);
        else if (keyChar=='k') add(0,-d);
        else if (keyChar=='j') add(d,0);
//repaint();
    }
    public boolean isFocusTraversable(){return true;}
    public void add(int dx,int dy)
    {
        end.x+=dx;
        end.y+=dy;
        Graphics g=getGraphics();
        g.drawLine(start.x,start.y,end.x,end.y);
//g.fillOval(end.x,end.y,10,10);
        g.dispose();
        start.x=end.x;
        start.y=end.y;
    }
    private Point start=new Point(0,0);
    private Point end=new Point(0,0);
}
class SketchFrame extends JFrame
{
    public SketchFrame()
    {
        Container contentPane=getContentPane();
        contentPane.add(new SketchPanel());
        setTitle("draw by hand");
        setSize(300,300);
        addWindowListener(new WindowAdapter()
        {
            public void windowClosing(WindowEvent e)
            {
                System.exit(0);
            }
        });
    }
}
public class Test
{
    public static void main(String args[])
    {
        JFrame test=new SketchFrame();
        test.setVisible(true);
    }
}