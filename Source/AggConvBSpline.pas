{ ****************************************************************************** }
{ * memory Rasterization with AGG support                                      * }
{ * by QQ 600585@qq.com                                                        * }
{ ****************************************************************************** }
{ * https://github.com/PassByYou888/CoreCipher                                 * }
{ * https://github.com/PassByYou888/ZServer4D                                  * }
{ * https://github.com/PassByYou888/zExpression                                * }
{ * https://github.com/PassByYou888/zTranslate                                 * }
{ * https://github.com/PassByYou888/zSound                                     * }
{ * https://github.com/PassByYou888/zAnalysis                                  * }
{ * https://github.com/PassByYou888/zGameWare                                  * }
{ * https://github.com/PassByYou888/zRasterization                             * }
{ ****************************************************************************** }

(*
  ////////////////////////////////////////////////////////////////////////////////
  //                                                                            //
  //  Anti-Grain Geometry (modernized Pascal fork, aka 'AggPasMod')             //
  //    Maintained by Christian-W. Budde (Christian@pcjv.de)                    //
  //    Copyright (c) 2012-2017                                                 //
  //                                                                            //
  //  Based on:                                                                 //
  //    Pascal port by Milan Marusinec alias Milano (milan@marusinec.sk)        //
  //    Copyright (c) 2005-2006, see http://www.aggpas.org                      //
  //                                                                            //
  //  Original License:                                                         //
  //    Anti-Grain Geometry - Version 2.4 (Public License)                      //
  //    Copyright (C) 2002-2005 Maxim Shemanarev (http://www.antigrain.com)     //
  //    Contact: McSeem@antigrain.com / McSeemAgg@yahoo.com                     //
  //                                                                            //
  //  Permission to copy, use, modify, sell and distribute this software        //
  //  is granted provided this copyright notice appears in all copies.          //
  //  This software is provided "as is" without express or implied              //
  //  warranty, and with no claim as to its suitability for any purpose.        //
  //                                                                            //
  ////////////////////////////////////////////////////////////////////////////////
*)
unit AggConvBSpline;

{$DEFINE FPC_DELPHI_MODE}
{$INCLUDE zDefine.inc}
interface
uses
  AggBasics,
  AggVcgenBSpline,
  AggConvAdaptorVcgen,
  AggVertexSource;

type
  TAggConvBSpline = class(TAggConvAdaptorVcgen)
  private
    FGenerator: TAggVcgenBSpline;

    procedure SetInterpolationStep(Value: Double);
    function GetInterpolationStep: Double;
  public
    constructor Create(Vs: TAggVertexSource);
    destructor Destroy; override;

    property InterpolationStep: Double read GetInterpolationStep write SetInterpolationStep;
  end;

implementation


{ TAggConvBSpline }

constructor TAggConvBSpline.Create;
begin
  FGenerator := TAggVcgenBSpline.Create;

  inherited Create(Vs, FGenerator);
end;

destructor TAggConvBSpline.Destroy;
begin
  FGenerator.Free;

  inherited;
end;

procedure TAggConvBSpline.SetInterpolationStep(Value: Double);
begin
  FGenerator.InterpolationStep := Value;
end;

function TAggConvBSpline.GetInterpolationStep: Double;
begin
  Result := FGenerator.InterpolationStep;
end;

end.
 
 
