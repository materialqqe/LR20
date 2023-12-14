unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw,
  Vcl.Menus;

type
  TForm5 = class(TForm)
    WebBrowser1: TWebBrowser;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
implementation

{$R *.dfm}

uses Unit1;

procedure TForm5.N1Click(Sender: TObject);
begin
  Hide; // Скрываем текущую форму (Form5)
  Form1.Show; // Отображаем главную форму (Form1)
end;





procedure TForm5.N2Click(Sender: TObject);
begin
halt;
end;

end.
