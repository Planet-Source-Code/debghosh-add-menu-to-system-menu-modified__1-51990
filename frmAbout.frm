VERSION 5.00
Begin VB.Form frmAbout 
   Caption         =   "About"
   ClientHeight    =   4125
   ClientLeft      =   2010
   ClientTop       =   2370
   ClientWidth     =   6810
   LinkTopic       =   "Form2"
   ScaleHeight     =   4125
   ScaleWidth      =   6810
   Begin VB.Label Label4 
      Caption         =   "This Is A Sizeable Form, I remove Minimize Button And Maximize Button of the form Programmatically."
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   525
      Left            =   240
      TabIndex        =   3
      Top             =   600
      Width           =   6315
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Pl Click On Caption Bar"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   240
      Left            =   2130
      TabIndex        =   2
      Top             =   195
      Width           =   2460
   End
   Begin VB.Label Label2 
      Caption         =   "Debasis Ghosh"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5100
      TabIndex        =   1
      Top             =   3675
      Width           =   1620
   End
   Begin VB.Label Label1 
      Caption         =   $"frmAbout.frx":0000
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1530
      Left            =   345
      TabIndex        =   0
      Top             =   1830
      Width           =   6195
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    Dim l As Long
    Dim m As Long
    Dim hsMenu As Long
    Dim Cnt As Long
    'Disable Maximize Button
    l = GetWindowLong(Me.hwnd, GWL_STYLE)
    l = l And Not WS_MAXIMIZEBOX
    SetWindowLong Me.hwnd, GWL_STYLE, l
    
    'Disable Minimize Button
    m = GetWindowLong(Me.hwnd, GWL_STYLE)
    m = m And Not WS_MINIMIZEBOX
    SetWindowLong Me.hwnd, GWL_STYLE, m
    
    hsMenu = GetSystemMenu(Me.hwnd, False)

    If hsMenu Then
        
        Cnt = GetMenuItemCount(hsMenu)
        If Cnt Then
        
            RemoveMenu hsMenu, Cnt - 2, MF_BYPOSITION Or MF_REMOVE 'Remove Separator
            RemoveMenu hsMenu, Cnt - 3, MF_BYPOSITION Or MF_REMOVE  'Remove Maximize
            RemoveMenu hsMenu, Cnt - 4, MF_BYPOSITION Or MF_REMOVE
            RemoveMenu hsMenu, Cnt - 5, MF_BYPOSITION Or MF_REMOVE
            RemoveMenu hsMenu, Cnt - 6, MF_BYPOSITION Or MF_REMOVE 'Remove Move Window
            RemoveMenu hsMenu, Cnt - 7, MF_BYPOSITION Or MF_REMOVE
            DrawMenuBar Me.hwnd

        End If
    End If
End Sub
