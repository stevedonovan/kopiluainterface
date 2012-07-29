using System;
using LuaInterface;

public class Vector {

}

public class Frodo {
    public void Beep(float x, float y, float z) {
        Console.WriteLine("beep 1!");
    }

    public void Beep(Vector v) {
        Console.WriteLine("beep 2!");
    }

    public void Beep() {
        Console.WriteLine("beep 3!");
    }

}

public class Simple {
    LuaFunction update;

    public Frodo baggins;

    public void Update() {
        update.Call(this);
    }

    public static void Main(string[] args) {
        Lua L = new Lua();
        Simple me = new Simple();
        L["this"] = me;
        L.DoString (@"
        function Update(self)
            print('got here',self)
            self.baggins:Beep(1,2,3)
        end

        ");
        me.update = (LuaFunction)L["Update"];
        me.baggins = new Frodo();
        me.Update();

    }

}
