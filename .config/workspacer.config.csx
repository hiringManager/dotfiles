#r "C:\Program Files\workspacer\workspacer.Shared.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.Bar\workspacer.Bar.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.Gap\workspacer.Gap.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.ActionMenu\workspacer.ActionMenu.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.FocusIndicator\workspacer.FocusIndicator.dll"

using System;
using System.Collections.Generic;
using System.Linq;
using workspacer;
using workspacer.Bar;
using workspacer.Bar.Widgets;
using workspacer.Gap;
//using workspacer.ActionMenu;
//using workspacer.FocusIndicator;/One

return new Action<IConfigContext>((IConfigContext context) =>
{
    /* Variables */
    /* Variables */
    var fontSize = 12;
    var barHeight = 19;
    var fontName = "PXPlus IBM VGA8";
    var background = new Color(0x0, 0x0, 0x0);

    /* Config */
    context.CanMinimizeWindows = true;

    /* Gap */
    var gap = barHeight - 8;
    var gapPlugin = context.AddGap(new GapPluginConfig() { InnerGap = gap, OuterGap = gap / 2, Delta = gap / 2 });

    /* Bar */
    context.AddBar(new BarPluginConfig()
    {
        FontSize = fontSize,
        BarHeight = barHeight,
        FontName = fontName,
        DefaultWidgetBackground = background,
        LeftWidgets = () => new IBarWidget[]
        {
            new WorkspaceWidget(), new TextWidget(": "), new TitleWidget() {
                IsShortTitle = true
            }
        },
        RightWidgets = () => new IBarWidget[]
        {
            new BatteryWidget(),
            new TimeWidget(1000, "HH:mm:ss dd-MMM-yyyy"),
            new ActiveLayoutWidget(),
        }
    });

    /* Bar focus indicator */
    // context.AddFocusIndicator();

    /* Default layouts */
    Func<ILayoutEngine[]> defaultLayouts = () => new ILayoutEngine[]
    {
        new TallLayoutEngine(),
        new VertLayoutEngine(),
        new HorzLayoutEngine(),
        new FullLayoutEngine(),
    };

    context.DefaultLayouts = defaultLayouts;

    /* Workspaces */
    // Array of workspace names and their layouts
    (string, ILayoutEngine[])[] workspaces =
    {
        ("Seraphina", defaultLayouts()),
        ("Isolde", defaultLayouts()),
        ("Nadya", defaultLayouts()),
        ("Catalina", defaultLayouts()),
        ("Alexandra", new ILayoutEngine[] { new HorzLayoutEngine(), new TallLayoutEngine() }),
        ("Vanessa", defaultLayouts()),
        ("Eliza", defaultLayouts()),
       // ("girl8", defaultLayouts()),
       // ("girl9", defaultLayouts()),
    };

    foreach ((string name, ILayoutEngine[] layouts) in workspaces)
    {
        context.WorkspaceContainer.CreateWorkspace(name, layouts);
    }

    /* Filters */
    context.WindowRouter.AddFilter((window) => !window.ProcessFileName.Equals("1Password.exe"));
    context.WindowRouter.AddFilter((window) => !window.ProcessFileName.Equals("pinentry.exe"));

    // The following filter means that Edge will now open on the correct display
    context.WindowRouter.AddFilter((window) => !window.Class.Equals("ShellTrayWnd"));

    /* Routes */
    context.WindowRouter.RouteProcessName("Discord", "Eliza");
    context.WindowRouter.RouteProcessName("Spotify", "Alexandra");
    context.WindowRouter.RouteTitle("Messages", "Eliza");
    context.WindowRouter.RouteTitle("Designer", "Isolde");
    context.WindowRouter.RouteProcessName("Spotify", "Alexandra");
    context.WindowRouter.RouteTitle("OneNote", "Nadya");
    context.WindowRouter.RouteTitle("Visual Studio Code", "Isolde");
    context.WindowRouter.RouteTitle("Microsoft To Do", "Nadya");
    context.WindowRouter.RouteProcessName("Typora", "Isolde");
    context.WindowRouter.RouteProcessName("YouTube", "Alexandra");


    context.WindowRouter.AddFilter((window) => !window.Title.Contains("PowerLauncher"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("barrier"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Screen Snipping"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Power"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Magnifier"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Wacom"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Notepad"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Express"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Dota"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("RetroArch"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Steam"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Search"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Desktop Window Manager"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Windows Input Experience"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("PenTablet"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Windows Terminal"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("_quake"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("quake"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Brawlhalla"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Calculator"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Sandbox"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Virtualbox"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("VPN"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Barrier"));

    /* Action menu */
    // var actionMenu = context.AddActionMenu(new ActionMenuPluginConfig()
    // {
    //     RegisterKeybind = false,
    //     MenuHeight = barHeight,
    //     FontSize = fontSize,
    //     FontName = fontName,
    //     Background = background,
    // });

    // /* Action menu builder */
    // Func<ActionMenuItemBuilder> createActionMenuBuilder = () =>
    // {
    //     var menuBuilder = actionMenu.Create();

    //     // Switch to workspace
    //     menuBuilder.AddMenu("switch", () =>
    //     {
    //         var workspaceMenu = actionMenu.Create();
    //         var monitor = context.MonitorContainer.FocusedMonitor;
    //         var workspaces = context.WorkspaceContainer.GetWorkspaces(monitor);

    //         Func<int, Action> createChildMenu = (workspaceIndex) => () =>
    //         {
    //             context.Workspaces.SwitchMonitorToWorkspace(monitor.Index, workspaceIndex);
    //         };

    //         int workspaceIndex = 0;
    //         foreach (var workspace in workspaces)
    //         {
    //             workspaceMenu.Add(workspace.Name, createChildMenu(workspaceIndex));
    //             workspaceIndex++;
    //         }

    //         return workspaceMenu;
    //     });

    //     // Move window to workspace
    //     menuBuilder.AddMenu("move", () =>
    //     {
    //         var moveMenu = actionMenu.Create();
    //         var focusedWorkspace = context.Workspaces.FocusedWorkspace;

    //         var workspaces = context.WorkspaceContainer.GetWorkspaces(focusedWorkspace).ToArray();
    //         Func<int, Action> createChildMenu = (index) => () => { context.Workspaces.MoveFocusedWindowToWorkspace(index); };

    //         for (int i = 0; i < workspaces.Length; i++)
    //         {
    //             moveMenu.Add(workspaces[i].Name, createChildMenu(i));
    //         }

    //         return moveMenu;
    //     });

    //     // Rename workspace
    //     menuBuilder.AddFreeForm("rename", (name) =>
    //     {
    //         context.Workspaces.FocusedWorkspace.Name = name;
    //     });

    //     // Create workspace
    //     menuBuilder.AddFreeForm("create workspace", (name) =>
    //     {
    //         context.WorkspaceContainer.CreateWorkspace(name);
    //     });

    //     // Delete focused workspace
    //     menuBuilder.Add("close", () =>
    //     {
    //         context.WorkspaceContainer.RemoveWorkspace(context.Workspaces.FocusedWorkspace);
    //     });

    //     // Workspacer
    //     menuBuilder.Add("toggle keybind helper", () => context.Keybinds.ShowKeybindDialog());
    //     menuBuilder.Add("toggle enabled", () => context.Enabled = !context.Enabled);
    //     menuBuilder.Add("restart", () => context.Restart());
    //     menuBuilder.Add("quit", () => context.Quit());

    //     return menuBuilder;
    // };
    // var actionMenuBuilder = createActionMenuBuilder();

    /* Keybindings */
    Action setKeybindings = () =>
    {
        KeyModifiers winShift = KeyModifiers.Win | KeyModifiers.Shift;
        KeyModifiers winCtrl = KeyModifiers.Win | KeyModifiers.Control;
        KeyModifiers win = KeyModifiers.Win;

        IKeybindManager manager = context.Keybinds;

        var workspaces = context.Workspaces;

        // manager.UnsubscribeAll();
        // manager.Subscribe(MouseEvent.LButtonDown, () => workspaces.SwitchFocusedMonitorToMouseLocation());

        // // Left, Right keys
        // manager.Subscribe(winCtrl, Keys.Left, () => workspaces.SwitchToPreviousWorkspace(), "switch to previous workspace");
        // manager.Subscribe(winCtrl, Keys.Right, () => workspaces.SwitchToNextWorkspace(), "switch to next workspace");

        // manager.Subscribe(winShift, Keys.Left, () => workspaces.MoveFocusedWindowToPreviousMonitor(), "move focused window to previous monitor");
        // manager.Subscribe(winShift, Keys.Right, () => workspaces.MoveFocusedWindowToNextMonitor(), "move focused window to next monitor");

        // // H, L keys
        // manager.Subscribe(winShift, Keys.H, () => workspaces.FocusedWorkspace.ShrinkPrimaryArea(), "shrink primary area");
        // manager.Subscribe(winShift, Keys.L, () => workspaces.FocusedWorkspace.ExpandPrimaryArea(), "expand primary area");

        // manager.Subscribe(winCtrl, Keys.H, () => workspaces.FocusedWorkspace.DecrementNumberOfPrimaryWindows(), "decrement number of primary windows");
        // manager.Subscribe(winCtrl, Keys.L, () => workspaces.FocusedWorkspace.IncrementNumberOfPrimaryWindows(), "increment number of primary windows");

        // // K, J keys
        // manager.Subscribe(winShift, Keys.K, () => workspaces.FocusedWorkspace.SwapFocusAndNextWindow(), "swap focus and next window");
        // manager.Subscribe(winShift, Keys.J, () => workspaces.FocusedWorkspace.SwapFocusAndPreviousWindow(), "swap focus and previous window");

        // manager.Subscribe(win, Keys.K, () => workspaces.FocusedWorkspace.FocusNextWindow(), "focus next window");
        // manager.Subscribe(win, Keys.J, () => workspaces.FocusedWorkspace.FocusPreviousWindow(), "focus previous window");

        // // Add, Subtract keys

        context.Keybinds.Subscribe(win, Keys.B, () => System.Diagnostics.Process.Start(@"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"));
        context.Keybinds.Subscribe(win, Keys.Enter, () => System.Diagnostics.Process.Start(@"C:\Users\iuseg\AppData\Local\Microsoft\WindowsApps\wt.exe"));

        manager.Subscribe(winCtrl, Keys.X, () => gapPlugin.IncrementInnerGap(), "increment inner gap");
        manager.Subscribe(winCtrl, Keys.Z, () => gapPlugin.DecrementInnerGap(), "decrement inner gap");

        manager.Subscribe(winShift, Keys.X, () => gapPlugin.IncrementOuterGap(), "increment outer gap");
        manager.Subscribe(winShift, Keys.Z, () => gapPlugin.DecrementOuterGap(), "decrement outer gap");

        // // Other shortcuts
        // manager.Subscribe(winCtrl, Keys.P, () => actionMenu.ShowMenu(actionMenuBuilder), "show menu");
        // manager.Subscribe(winShift, Keys.Escape, () => context.Enabled = !context.Enabled, "toggle enabled/disabled");
        // manager.Subscribe(winShift, Keys.I, () => context.ToggleConsoleWindow(), "toggle console window");
    };
    setKeybindings();
});

