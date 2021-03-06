unit scroll_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
    HB = 446;  // ������ ������� ������
              // �������� �� �����
    HR = 678; // ������ �������
    { � ���������� ������ ������ � �����
      ������ ���� ������������� �� ���������
      ��� ����.
      ������ �������������� ��������
      (�������� ������ � �����)
      ������ ���� ������ ��� �����
      HB+HR.
    }

var
    pic,sp,Bitmap :TBitMap;       // �������������� ��������
    sRect,dRect,os,us: TRect; // ������� ��������
    t,u: integer;

procedure TForm1.FormCreate(Sender: TObject);
begin
    pic := TBitMap.Create;
    pic.LoadFromFile('baner.bmp');       // ��������� ��������
    dRect := Bounds(10,10,pic.Width,HB); // ��������� � ������
                                         // �������, � �������
                                         // �������������� ��������
    sRect := Rect(0,0,pic.Width,HB);     // ������������ �������

  Bitmap := TBitmap.Create;

    with Bitmap do begin
      LoadFromFile('sprite.bmp');
      Transparent := True;
      TransParentColor := BitMap.canvas.pixels[50,50];
      Form1.Canvas.Draw(0,0,BitMap);
      TransparentMode := tmAuto;
      Form1.Canvas.Draw(50,50,BitMap);
         end;

   // Bitmap.Free;

    t:=0;
end;

// ������ �� �������
procedure TForm1.Timer1Timer(Sender: TObject);
begin

        if t > HR then t:=0 else inc(t);
        if u > 400 then u:=0 else inc(u);

    image2.Canvas.CopyRect(dRect,pic.Canvas,sRect); // ���������� ����� ��������
    sRect := Bounds(t,0,pic.Width,HB);  // ��������� ����

        image2.Canvas.Draw(u,50,BitMap);
             image2.Visible:=true;
    end;

// ������ �� ������ OK
end.
