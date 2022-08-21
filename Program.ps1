Import-Module .\RegistrationDetailsPnP.ps1

$ListUrl = "pnp_testlist"
$ListName = "PnpTest"

$FieldFullName = '<Field Type="Text" Name="FullName" DisplayName="FullName"/>'
$FieldAge='<Field Type="Number" Name="Age" Min="1" Max="999" DisplayName="Age"/>'
$FiledDOB='<Field Type="DateTime" Format="DateTime" Name="DOB" DisplayName="DOB"/>'
$FieldEmail='<Field Type="Text" Name="Email" DisplayName="Email"/>'
$FieldPhone='<Field Type="Text" Name="Phone" DisplayName="Phone"/>'
$FieldAddress='<Field Type="Note" Name="Address" DisplayName="Address"/>'
$FieldAvatar='<Field Type="Image" Name="Avatar" DisplayName="Avatar"/>'
$FieldTShirtSize='<Field Type="Choice" Format="RadioButtons" Name="TShirtSize" DisplayName="TShirtSize">
		<CHOICES>
			<CHOICE>XS</CHOICE>
			<CHOICE>S</CHOICE>
			<CHOICE>M</CHOICE>  
			<CHOICE>L</CHOICE>
			<CHOICE>XL</CHOICE>
			<CHOICE>XXL</CHOICE>
		</CHOICES>
	</Field>'
$FieldPaymentMethod='<Field Type="Choice" Format="Dropdown" Name="PaymentMethod" DisplayName="PaymentMethod">
		<CHOICES>
			<CHOICE>Cash</CHOICE>
			<CHOICE>Credit Card</CHOICE>
			<CHOICE>Check</CHOICE>
			<CHOICE>PayPal</CHOICE>
			<CHOICE>Bank Transfer</CHOICE>
		</CHOICES>
	</Field>'
$FiledRegisterFee='<Field Type="Choice" Format="RadioButtons"  Name="RegisterFee" DisplayName="RegisterFee">
		<CHOICES>
			<CHOICE>3K run $20</CHOICE>
			<CHOICE>5K run $30</CHOICE>
			<CHOICE>10K run $40</CHOICE>  
        </CHOICES>
    </Field>'

CreateCustomList -ListName $ListUrl
CreateFieldFromXml -FieldName "FullName" -ListName $ListUrl -FieldXml $FieldFullName
CreateFieldFromXml -FieldName "Age" -ListName $ListUrl -FieldXml $FieldAge
CreateFieldFromXml -FieldName "DOB" -ListName $ListUrl -FieldXml $FiledDOB
CreateFieldFromXml -FieldName "Email" -ListName $ListUrl -FieldXml $FieldEmail
CreateFieldFromXml -FieldName "Phone" -ListName $ListUrl -FieldXml $FieldPhone
CreateFieldFromXml -FieldName "Address" -ListName $ListUrl -FieldXml $FieldAddress
CreateFieldFromXml -FieldName "Avatar" -ListName $ListUrl -FieldXml $FieldAvatar
CreateFieldFromXml -FieldName "TShirtSize" -ListName $ListUrl -FieldXml $FieldTShirtSize
CreateFieldFromXml -FieldName "PaymentMethod" -ListName $ListUrl -FieldXml $FieldPaymentMethod
CreateFieldFromXml -FieldName "RegisterFee" -ListName $ListUrl -FieldXml $FiledRegisterFee