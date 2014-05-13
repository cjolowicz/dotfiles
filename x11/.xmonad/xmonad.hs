import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.WindowArranger
import qualified Data.Map        as M
import qualified XMonad.StackSet as W
import Data.Ratio
import System.Exit

main = xmonad $ defaultConfig {
         modMask            = mod4Mask
       , normalBorderColor  = "#000044"
       , focusedBorderColor = "#0000ff"
       , keys               = myKeys
       , layoutHook         = windowArrange myLayout
       , logHook            = dynamicLogWithPP $ dzenPP {
          ppCurrent         = dzenColor "#303030" "#909090" . pad
        , ppHidden          = dzenColor "#909090" "" . pad
        , ppHiddenNoWindows = dzenColor "#606060" "" . pad
        , ppLayout          = dzenColor "#909090" "" . pad
        , ppUrgent          = dzenColor "#ff0000" "" . pad . dzenStrip
        , ppTitle           = shorten 100
        , ppOrder           = reverse
        , ppSep             = dzenColor "#303030" "" " :: "
        }
       }

myLayout = avoidStruts (Full ||| Mirror tiled ||| tiled)
  where
     tiled = Tall 1 (3/100) (1/2)

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    [ ((modMask .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    , ((modMask,               xK_p     ), runExecutable)
    , ((modMask .|. shiftMask, xK_p     ), runInTerminal)
    , ((modMask,               xK_i     ), viewManPage)
    , ((modMask .|. shiftMask, xK_c     ), kill)
    , ((modMask,               xK_space ), sendMessage NextLayout)
    , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modMask,               xK_n     ), refresh)
    , ((modMask,               xK_Tab   ), windows W.focusDown)
    , ((modMask,               xK_j     ), windows W.focusDown)
    , ((modMask,               xK_k     ), windows W.focusUp  )
    , ((modMask,               xK_m     ), windows W.focusMaster  )
    , ((modMask,               xK_Return), windows W.swapMaster)
    , ((modMask .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modMask .|. shiftMask, xK_k     ), windows W.swapUp    )
    , ((modMask,               xK_h     ), sendMessage Shrink)
    , ((modMask,               xK_l     ), sendMessage Expand)
    , ((modMask,               xK_t     ), withFocused $ windows . W.sink)
    , ((modMask              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modMask              , xK_period), sendMessage (IncMasterN (-1)))
    , ((modMask .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modMask              , xK_q     ), restart "xmonad" True)
    ]
    ++
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, controlMask)]]

runExecutable = spawn "exe=`dmenu_path | dmenu -b` && eval \"exec $exe\""
runInTerminal = spawn "exe=`dmenu_path | dmenu -b` && eval \"exec xterm -e $exe\""
viewManPage   = spawn "manpage=`dmenu_manpath | dmenu -b` && eval \"exec xterm -e man $manpage\""
