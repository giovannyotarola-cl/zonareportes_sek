@Functions

	'
	' Page class (rptdefault)
	'
	Public Class crrptdefault(Of C As {crConnection, New}, S As {cAdvancedSecurity, New})
		Inherits crrptdefault_base(Of C, S)

		'
		' Server events
		'

	End Class

	' rptdefault
	Public Shared Property rptdefault As crrptdefault(Of crConnection, cAdvancedSecurity)
		Get
			Return CType(ewr_PageData("rptdefault"), crrptdefault(Of crConnection, cAdvancedSecurity))
		End Get
		Set(ByVal Value As crrptdefault(Of crConnection, cAdvancedSecurity))
			ewr_PageData("rptdefault") = Value
		End Set
	End Property

	' CurrentPage	
	Public Shared Property CurrentPage As crrptdefault(Of crConnection, cAdvancedSecurity) 
		Get
			Return CType(ewr_PageData("CurrentPage"), crrptdefault(Of crConnection, cAdvancedSecurity))
		End Get
		Set(ByVal Value As crrptdefault(Of crConnection, cAdvancedSecurity))
			ewr_PageData("CurrentPage") = Value
		End Set
	End Property

	' CurrentTable	
	Public Shared Property CurrentTable As crrptdefault(Of crConnection, cAdvancedSecurity) 
		Get
			Return CurrentPage
		End Get
		Set(ByVal Value As crrptdefault(Of crConnection, cAdvancedSecurity))
			CurrentPage = Value
		End Set
	End Property
End Functions
@Code

	' Header
	ewr_Header(False)

	' Create page object
	If rptdefault Is Nothing Then
		rptdefault = New crrptdefault(Of crConnection, cAdvancedSecurity)()
	End If
	CurrentPage = rptdefault

	' Page init
	CurrentPage.Page_Init()

	' Page main
	CurrentPage.Page_Main()
End Code
@Code
	CurrentPage.Page_Terminate()
End Code
