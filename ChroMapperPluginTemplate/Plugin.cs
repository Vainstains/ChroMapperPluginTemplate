using System.Reflection;
using UnityEngine;
using HarmonyLib;

namespace ChroMapperPluginTemplate;

[Plugin(Name)]
public class Plugin
{
    public const string Author = "YourName";
    public const string Name = "ChroMapperPluginTemplate";
    public const string ID = $"com.{Author}.{Name}";

    [Init]
    private void Init()
    {
        new Harmony(ID)
            .PatchAll(Assembly.GetExecutingAssembly());
        
        Debug.Log($"Hello from {Name}!");
    }
}