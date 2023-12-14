unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Imaging.jpeg;

type
  TForm4 = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Label4: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  Form1:TForm;

implementation

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
   Timer1.Enabled := True;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled := False;
  Form1.Show;
  Form4.Hide;
end;

end.
