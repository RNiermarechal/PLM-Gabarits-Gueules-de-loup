VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} Feuille_saisie 
   Caption         =   "G�n�ration d'un tube � partir du filaire"
   ClientHeight    =   2750
   ClientLeft      =   50
   ClientTop       =   390
   ClientWidth     =   4440
   OleObjectBlob   =   "Feuille_saisie.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "Feuille_saisie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Bouton_ok_Click()
creation = "oui"
Dimension = ComboBox1.Value
Feuille_saisie.Hide
End Sub
Private Sub Bouton_annuler_Click()
creation = "non"
fin = True
Feuille_saisie.Hide
End Sub


Private Sub CommandButton1_Click()
Feuille_saisie.Hide

Dim Usel As Selection
Dim UselLB As Object
Dim InputObject(0)
Dim oStatus As String
Dim ref1, coord(2)
Dim longueur As AnyObject
Dim TheSpaWorkbench As SPAWorkbench

InputObject(0) = "Line"
Set Usel = CATIA.ActiveDocument.Selection
Set UselLB = Usel

Usel.Clear

oStatus = UselLB.SelectElement2(InputObject, "Selectionner le support", False)

If (oStatus = "Cancel") Then
Exit Sub
Else

TextBox1.Text = UselLB.Item2(1).Value.Name
MaDroite = UselLB.Item2(1).Value.Name

Set TheSpaWorkbench = CATIA.ActiveDocument.GetWorkbench("SPAWorkbench")
Set longueur = Usel.Item2(1).Value
Set Mesure = TheSpaWorkbench.GetMeasurable(longueur)
L = Mesure.Length / 2
End If

Bouton_ok.Enabled = True
Usel.Clear
Feuille_saisie.Show

End Sub

Private Sub UserForm_Initialize()
ComboBox1.AddItem "30*2"
ComboBox1.AddItem "30*1.5"
ComboBox1.AddItem "25*1.5"
ComboBox1.AddItem "20*1.5"
ComboBox1.AddItem "15*1.5"
End Sub

