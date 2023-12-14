unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,StrUtils, Vcl.Menus,Math,
  Vcl.OleCtrls, SHDocVw;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button9: TButton;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit8: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Button3: TButton;
    Button8: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private

    { Private declarations }
  public
  BinaryNumber: string;
  HexNumber: string;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2,Unit5,shellapi;

procedure TForm1.Button1Click(Sender: TObject);
begin
edit1.Visible:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
edit2.Visible:=true;
end;



procedure TForm1.Button3Click(Sender: TObject);
begin
Edit1.Clear;
Edit2.Clear;
Edit4.Clear;
Edit5.Clear;
Edit6.Clear;
Edit8.Clear;
Edit1.Visible:=False;
Edit2.Visible:=False;
Edit4.Visible:=False;
Edit5.Visible:=False;
Edit6.Visible:=False;
Edit8.Visible:=False;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
edit4.Visible:=true;
end;


function BinToDec(Bin: string): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := Length(Bin) downto 1 do
    if Bin[i] = '1' then
      Result := Result + Trunc(Power(2, Length(Bin) - i));
end;

function BinToInt(binary: string): Integer;
var
  i, value, mul: Integer;
begin
  value := 0;
  mul := 1;
  for i := Length(binary) downto 1 do
  begin
    if binary[i] = '1' then
      value := value + mul;
    mul := mul * 2;
  end;
  Result := value;
end;
function BinToHex(Bin: string): string;
var
  Dec: Integer;
begin
  Dec := BinToDec(Bin);
  Result := IntToHex(Dec, (Length(Bin) + 3) div 4);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  i: Integer;
  hex_num: string;
  dec_num: integer;
  bin_num: string;
  s: string;
begin
  if Edit1.Text <> '' then
  begin
    i := StrToInt(Edit1.Text);
    s := IntToHex(i, 2);
    Edit6.Text := s;
    s := '';
    while i > 0 do
    begin
      if i mod 2 = 0 then
        s := '0' + s
      else
        s := '1' + s;
      i := i div 2;
    end;
    Edit8.Text := s;
  end;

  if Edit2.Text <> '' then
  begin
    hex_num := Edit2.Text;
    dec_num := StrToInt('$' + hex_num);
    Edit5.Text := IntToStr(dec_num);
    bin_num := '';
    while dec_num > 0 do
    begin
      bin_num := IntToStr(dec_num mod 2) + bin_num;
      dec_num := dec_num div 2;
    end;
    Edit8.Text := bin_num;
  end;

  if Edit4.Text <> '' then
  begin
    Edit5.Text := IntToStr(BinToDec(Edit4.Text));
    Edit6.Text := BinToHex(Edit4.Text);
  end;
end;




procedure TForm1.Button6Click(Sender: TObject);
begin
edit5.Visible:=true;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
edit6.Visible:=true;
end;

  procedure TForm1.Button8Click(Sender: TObject);
var
  binStr: string;
  MyStrings: TStringList;
  DecimalNumber, HexNumber: Integer;
  BinaryNumber: string;
  HTMLCode: string;
begin
  MyStrings := TStringList.Create;
  try
    if (Edit1.Visible = True) and (Edit6.Visible = True) then
    begin
      Form5.Show;
      DecimalNumber := StrToInt(Edit1.Text);
      HexNumber := DecimalNumber;
      MyStrings.Add('Алгоритм перевода числа из десятичной системы счисления в шестнадцатеричную:<br>');
      repeat
        MyStrings.Add(IntToStr(HexNumber) + ' / 16 = ' + IntToStr(HexNumber div 16) + ' (остаток ' + IntToHex(HexNumber mod 16, 1) + ')');
        HexNumber := HexNumber div 16;
      until HexNumber = 0;

      MyStrings.Add('Записываем остаток в обратном порядке<br>');
      Edit6.Text := IntToHex(DecimalNumber, 1);
      MyStrings.Add('Число в шестнадцатиричной системе счисления:' + Edit6.Text + '<sub>16</sub><br>');
    end

    else if (Edit1.Visible = True) and (Edit8.Visible = True) and (Edit6.Visible = False) then
    begin
      Form5.Show;
      DecimalNumber := StrToInt(Edit1.Text);
      BinaryNumber := '';
      MyStrings.Add('Алгоритм перевода числа из десятичной системы счисления в двоичную:<br>');
      MyStrings.Add('Делим число ' + IntToStr(DecimalNumber) + ' на 2 и записываем остатки в обратном порядке:<br>');
      while DecimalNumber > 0 do
      begin
        BinaryNumber := IntToStr(DecimalNumber mod 2) + BinaryNumber;
        MyStrings.Add(IntToStr(DecimalNumber) + ' / 2 = ' + IntToStr(DecimalNumber div 2) + ' (остаток ' + IntToStr(DecimalNumber mod 2) + ')');
        DecimalNumber := DecimalNumber div 2;
      end;
      Edit8.Text := BinaryNumber;
      MyStrings.Add('Число в двоичной системе счисления: ' + BinaryNumber + '<sub>2</sub><br>');
    end

    else if (Edit2.Visible = True) and (Edit5.Visible = True) then
    begin
      Form5.Show;
      HexNumber := StrToInt('$' + Edit2.Text);
      DecimalNumber := 0;
      MyStrings.Add('Алгоритм перевода числа из шестнадцатеричной системы счисления в десятичную:<br>');
      MyStrings.Add('Разбиваем число ' + Edit2.Text + '<sub>16</sub> на цифры и переводим каждую цифру в десятичную систему счисления:<br>');
      for var i := Length(Edit2.Text) downto 1 do
      begin
        var digit := Edit2.Text[i];
        var value := 0;
        case digit of
          '0'..'9': value := Ord(digit) - Ord('0');
          'A'..'F': value := Ord(digit) - Ord('A') + 10;
        end;
        DecimalNumber := DecimalNumber + value * Trunc(IntPower(16, Length(Edit2.Text) - i));
        MyStrings.Add(digit + '<sub>16</sub> = ' + IntToStr(value) + '<sub>10</sub>');
      end;
      Edit5.Text := IntToStr(DecimalNumber);
      MyStrings.Add('Складываем все цифры:<br>');
      MyStrings.Add(Edit2.Text + '<sub>16</sub> = ' + IntToStr(DecimalNumber) + '<sub>10</sub><br>');

      // Add the new algorithm
      var DecimalNumber2 := 0;
      MyStrings.Add('Алгоритм перевода числа из шестнадцатеричной системы счисления в десятичную (другой способ):<br>');
      MyStrings.Add('Умножаем каждый разряд числа на 16^n, где n - номер разряда, начиная с 0, и суммируем полученные значения:<br>');
      for var i := Length(Edit2.Text) downto 1 do
      begin
        var digit := Edit2.Text[i];
        var value := 0;
        case digit of
          '0'..'9': value := Ord(digit) - Ord('0');
          'A'..'F': value := Ord(digit) - Ord('A') + 10;
        end;
        DecimalNumber2 := DecimalNumber2 + value * Trunc(IntPower(16, Length(Edit2.Text) - i));
        MyStrings.Add(digit + '<sub>16</sub> * 16^' + IntToStr(Length(Edit2.Text) - i) + ' = ' + IntToStr(value * Trunc(IntPower(16, Length(Edit2.Text) - i))));
      end;
      MyStrings.Add('Складываем все значения:<br>');
      MyStrings.Add(Edit2.Text + '<sub>16</sub> = ' + IntToStr(DecimalNumber2) + '<sub>10</sub><br>');
    end

    else if (Edit4.Visible = True) and (Edit5.Visible = True) then
    begin
      Form5.Show;
      BinaryNumber := Edit4.Text;
      DecimalNumber := 0;
      MyStrings.Add('Алгоритм перевода числа из двоичной системы счисления в десятичную:<br>');
      MyStrings.Add('Разбиваем число ' + BinaryNumber + '<sub>2</sub> на цифры и переводим каждую цифру в десятичную систему счисления:<br>');
      for var i := Length(BinaryNumber) downto 1 do
      begin
        var digit := BinaryNumber[i];
        var value := 0;
        case digit of
          '0': value := 0;
          '1': value := 1;
        end;
        DecimalNumber := DecimalNumber + value * Trunc(IntPower(2, Length(BinaryNumber) - 1));
        MyStrings.Add(digit + '<sub>2</sub> = ' + IntToStr(value) + '<sub>10</sub>');
      end;
      Edit5.Text := IntToHex(DecimalNumber, Length(BinaryNumber) div 4);
      MyStrings.Add('Каждый разряд двоичного числа умножаем на 2 в степени n, где n - номер разряда, начиная с 0:');
      binStr := Edit4.Text;
      for var i := Length(binStr) downto 1 do
      begin
        MyStrings.Add(binStr[i] + ' * 2^' + FloatToStr(Length(binStr) - i) + ' = ' + FloatToStr(StrToInt(binStr[i]) * Power(2, Length(binStr) - i)));
      end;
    end

    else if (Edit2.Visible = True) and (Edit8.Visible = True) then
    begin
      Form5.Show;
      HexNumber := StrToInt('$' + Edit2.Text);
      BinaryNumber := '';
      MyStrings.Clear; // Clear the previous content in MyStrings
      MyStrings.Add('Алгоритм перевода числа из шестнадцатеричной системы счисления в двоичную:<br>');
      MyStrings.Add('Разбиваем число ' + Edit2.Text + '<sub>16</sub> на цифры и переводим каждую цифру в двоичную систему счисления:<br>');
      for var i := Length(Edit2.Text) downto 1 do
      begin
        var digit := Edit2.Text[i];
        var value := 0;
        case digit of
          '0'..'9': value := Ord(digit) - Ord('0');
          'A'..'F': value := Ord(digit) - Ord('A') + 10;
        end;
        var binaryValue: string := '';
        for var j := 3 downto 0 do
        begin
          if (value and (1 shl j)) <> 0 then
            binaryValue := binaryValue + '1'
          else
            binaryValue := binaryValue + '0';
        end;
        BinaryNumber := BinaryNumber + binaryValue;
        MyStrings.Add(digit + '<sub>16</sub> = ' + binaryValue + '<sub>2</sub>');
      end;
    end
          else if (Edit4.Visible = True) and (Edit6.Visible = True) then
begin
  Form5.Show;
  BinaryNumber := Edit4.Text;
  DecimalNumber := 0;
  MyStrings.Add('Алгоритм перевода числа из двоичной системы счисления в шестнадцатеричную:<br>');
  MyStrings.Add('Разбиваем число ' + BinaryNumber + '<sub>2</sub> на группы по 4 цифры и переводим каждую группу в шестнадцатеричную систему счисления:<br>');

  // Добавляем ведущие нули, чтобы обеспечить кратность 4
  while Length(BinaryNumber) mod 4 <> 0 do
    BinaryNumber := '0' + BinaryNumber;

  for var i := 1 to Length(BinaryNumber) div 4 do
  begin
    var group := Copy(BinaryNumber, (i - 1) * 4 + 1, 4);
    var value := 0;
    for var j := 1 to 4 do
      value := value * 2 + Ord(group[j]) - Ord('0');

    MyStrings.Add(group + '<sub>2</sub> = ' + IntToHex(value, 1) + '<sub>16</sub>');
  end;


  MyStrings.Add('Число в шестнадцатеричной системе счисления: ' + Edit6.Text + '<sub>16</sub><br>');
end;





    MyStrings.SaveToFile('myfile.html');
    Form5.WebBrowser1.Navigate('file://' + GetCurrentDir + '\myfile.html');
  finally
    MyStrings.Free;
  end;
end;


procedure TForm1.Button9Click(Sender: TObject);
begin
edit8.Visible:=true;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
ShellExecute(0,PChar('open'),PChar('Spravka.chm'),nil,nil,SW_SHOW);
end;

procedure TForm1.N2Click(Sender: TObject);
var
  MessageForm: TForm;
begin
  MessageForm := CreateMessageDialog('Разработчик: Кривенко Евгений Витальевич'+#13#10+'Группа: ПЗТ-37', mtInformation, [mbOK]);
  try
    MessageForm.Color := clSilver; // изменить цвет фона на серый
    MessageForm.BorderStyle := bsNone;// скрыть заголовок и кнопку закрытия
    MessageForm.ShowModal;
  finally
    MessageForm.Free;
  end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
halt;
end;

end.
