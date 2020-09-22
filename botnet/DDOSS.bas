Attribute VB_Name = "s"
' created by m1k3
' www.blogjot.com / www.haxt.net

Public Function RequestFile(UrL As String)


Dim xml0 As MSXML2.XMLHTTP30
Set xml0 = New MSXML2.XMLHTTP30
xml0.open "GET", UrL, False
xml0.send

Dim xml1 As MSXML2.XMLHTTP30
Set xml1 = New MSXML2.XMLHTTP30
xml1.open "GET", UrL, False
xml1.send

Dim xml2 As MSXML2.XMLHTTP30
Set xml2 = New MSXML2.XMLHTTP30
xml2.open "GET", UrL, False
xml2.send

Dim xml3 As MSXML2.XMLHTTP30
Set xml3 = New MSXML2.XMLHTTP30
xml3.open "GET", UrL, False
xml3.send

Dim xml4 As MSXML2.XMLHTTP30
Set xml4 = New MSXML2.XMLHTTP30
xml4.open "GET", UrL, False
xml4.send



End Function

