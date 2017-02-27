-- file: ch23/PodMainGUI.hs

module PodMainGUI where
import PodDownload
import PodDB
import PodTypes
import System.Envrionment
import Database.HDBC
import Network.Socket(withSocketsDo)

-- GUI libraries

import Graphics.UI.Gtk hiding (disconnect)
import Graphics.UI.Gtk.Glade

-- Threading

import Control.Concurrent

data GUI = GUI {
  mainWin :: Window,
  mwAddBt :: Button,
  mwUpdateBt :: Button,
  mwDownloadBt :: Button,
  mwFetchBt :: Button,
  mwExitBt :: Button,
  statusWin :: Dialog,
  swOKBt :: Button,
  swCancelBt :: Button,
  swLabel :: Label,
  addWin :: Dialog,
  awOKBt :: Button,
  awCancelBt :: Button,
  awEntry :: Entry}

main :: FilePath -> IO ()
main gladepath = withSocketsDo $ handleSqlError $ do initGUI timeoutAddFull (yield >> return True) priorityDefaultIdle 100
    -- Load the GUI from the Glade file
    gui <- loadGlade gladepath
    -- Connect to the database
    dbh <- connect "pod.db"
    -- Set up our events
    connectGui gui dbh
    -- Run the GTK+ main loop; exits after GUI is done
    mainGUI
    -- Disconnect from the database at the end
    disconnect dbh

loadGlade gladepath = do
    -- Load XML from glade path.
    -- Note: crashes with a runtime error on console if fails!
    Just xml <- xmlNew gladepath
    -- Load main window
    mw <- xmlGetWidget xml castToWindow "mainWindow"
    -- Load all buttons
    [mwAdd, mwUpdate, mwDownload, mwFetch, mwExit, swOK, swCancel, auOK, auCancel] <-
    mapM (xmlGetWidget xml castToButton)
    ["addButton", "updateButton", "downloadButton", "fetchButton", "exitButton", "okButton", "cancelButton", "auOK", "auCancel"]
    sw <- xmlGetWidget xml castToDialog "statusDialog"
    swl <- xmlGetWidget xml castToLabel "statusLabel"
    au <- xmlGetWidget xml castToDialog "addDialog"
    aue <- xmlGetWidget xml castToEntry "auEntry"
    return $ GUI mw mwAdd mwUpdate mwDownload mwFetch mwExit sw swOK swCancel swl au auOK auCancel aue

connectGui gui dbh = do
    -- When the close button is clicked, terminate the GUI loop
    -- by calling GTK mainQuit function
    onDestroy (mainWin gui) mainQuit
    -- Main window buttons
    onClicked (mwAddBt gui) (guiAdd gui dbh)
    onClicked (mwUpdateBt gui) (guiUpdate gui dbh)
    onClicked (mwDownloadBt gui) (guiDownload gui dbh)
    onClicked (mwFetchBt gui) (guiFetch gui dbh)
    onClicked (mwExitBt gui) mainQuit
    -- We leave the status window buttons for later
