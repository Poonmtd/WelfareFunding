<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    </head>
    <style>
        {{{font}}}
        @media print {
            @page{
                size: A4;
                margin-top: .5cm;
                margin-left: 1.5cm;
                margin-right: 1cm;
                margin-bottom: 1.5cm;
            }
            .new-page{
                page-break-before: always !important;
                page-break-inside: avoid;
                clear: both !important;				
            }
            .page-break{
                page-break-after: always;
            }
            .document{
                width: unset;
                margin: 0;
            }
            *{
                -webkit-print-color-adjust: exact !important;
                color-adjust: exact !important;
                print-color-adjust: exact !important;
            }
        }
        *{
            font-family: 'THSarabunPSK' !important;
            box-sizing: border-box !important;
            margin: 0;
            padding: 0;
            border-color: #000;
            border-width: 1px;
        }
        {{{css}}}
        .document{
            font-size: 16pt;
            page-break-after: always !important;
            height: 27.7cm;
            width: 18.5cm;
            position: relative;
            margin: auto;
        }
        .tab-size-2cm5mm.ql-editor{
            tab-size: 2.5cm;
        }
        .ql-editor{
            overflow: hidden !important;
        }
        .header{
            width: 100%;
            font-size: 14pt;
            position: relative;
        }
        .head{
            padding-top: 1cm;
            font-size: 20pt;
            text-align: center;
            font-weight: bold;
        }
        .footer{
            position: absolute;
            bottom: 0;
            width: 100%;
            font-size: 14pt;
        }
        .topic{
            font-weight: 600;  
            text-align: center;
            position: absolute;
            width: 100%;
            top: 70pt;
        }
        .body{
            position: absolute;
            top: 120pt;
            width: 100%;
        }
        .picture{
            width: 70pt;
            height: 92pt;
            border: 1px solid;
            position: absolute;
            top: 0;
            right: 0;
        }
        p {
            font-weight: 600;
        }
        .box .list{
            border-style: solid;
            border-width: thin;
            /* padding: 5pt; */
            width: 15pt;
            text-align: center;
        }

        .box{
            display: flex;
            flex-direction: row;
            width: 40%;
            padding-right: 5pt;
        }
        .flex-column-center{
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .graduateTable table, .governmentTable table, .trainTable table{
            display: table;
            border-collapse: collapse;
            box-sizing: border-box;
            text-indent: initial;
            border-spacing: 2px;
            font-size: .9em;
            border: solid 1px;
            width: 100%;
        }
        .graduateTable th, .governmentTable th, .trainTable th{
            border: 1px solid black;
            padding: 5px;
            text-align: center;
        }
        .graduateTable thead, .governmentTable thead, .trainTable thead{
            display: table-header-group;
            vertical-align: middle;
            border-color: inherit;
            border: 1px solid;
        }
        .graduateTable td, .governmentTable td, .trainTable td{
            border: 1px solid black;
            padding: 5px;
        }
        .graduateTable tr{
            height: 40pt;
        }
        .governmentTable tr, .trainTable tr{
            height: 20pt;
        }
    </style>
    <body>
        <div class="document">
            <div class="header">
                <div class="topic" style="font-size: 16pt;">แบบแสดงความประสงค์ขอโอนมารับราชการเป็นข้าราชการพลเรือน
                    <br>สังกัดศูนย์อำนวยการรักษาผลประโยชน์ของชาติทางทะเล
                </div>
                <div class="picture" style="display: flex; align-items: center;">
                    <div style="text-align: center; width: 100%;">
                        รูปถ่าย
                        <br>๑ นิ้ว
                        <br>(ถ่ายไว้ไม่เกิน
                        <br>๖ เดือน)
                    </div>
                </div>
            </div>
            <div class="body">
                <div style="text-align: end;">
                    <div>เขียนที่.........................</div>
                    <div>วันที่............เดือน......................พ.ศ......................</div>
                </div>
                <div style="margin-top: 20pt;">เรื่อง ขอโอนมารับราชการสังกัดศูนย์อำนวยการรักษาผลประโยชน์ของชาติทางทะเล</div>
                <div>เรียน เลขาธิการศูนย์อำนวยการรักษาผลประโยชน์ของชาติทางทะเล</div>
                <div style="margin-left: 10%;">
                    <div style="display: flex; margin-top: 10pt;"><p style="margin-right: 15pt;">๑. ข้าพเจ้า</p>(นาย/นาง/นางสาว) ชื่อ......................................นามสกุล....................................................................</div>
                    <div style="display: flex; margin-top: 20pt;">
                        <p>๒. ศาสนา</p>
                        <div style="display: flex; justify-content: center; margin-left: 15pt;">
                            <svg height="25" width="60" xmlns="http://www.w3.org/2000/svg">
                                <ellipse cx="15" cy="12.5" rx="12" ry="6" style="fill:white;stroke:black;stroke-width:1" /> 
                            </svg>
                            <div>พุทธ</div>
                        </div>
                        <div style="display: flex; justify-content: center; margin-left: 15pt;">
                            <svg height="25" width="60" xmlns="http://www.w3.org/2000/svg">
                                <ellipse cx="15" cy="12.5" rx="12" ry="6" style="fill:white;stroke:black;stroke-width:1" /> 
                            </svg>
                            <div>คริสต์</div>
                        </div>  
                        <div style="display: flex; justify-content: center; margin-left: 15pt;">
                            <svg height="25" width="60" xmlns="http://www.w3.org/2000/svg">
                                <ellipse cx="15" cy="12.5" rx="12" ry="6" style="fill:white;stroke:black;stroke-width:1" /> 
                            </svg>
                            <div>อิสลาม</div>
                        </div>
                        <div style="display: flex; justify-content: center; margin-left: 15pt;">
                            <svg height="25" width="60" xmlns="http://www.w3.org/2000/svg">
                                <ellipse cx="15" cy="12.5" rx="12" ry="6" style="fill:white;stroke:black;stroke-width:1" /> 
                            </svg>
                            <div>อื่นๆ....................................................................</div>
                        </div>
                    </div>
                    <div style="display: flex; margin-top: 20pt;">
                        <p>๓. สถานภาพ</p>
                        <div style="display: flex; justify-content: center; margin-left: 15pt;">
                            <svg height="25" width="60" xmlns="http://www.w3.org/2000/svg">
                                <ellipse cx="15" cy="12.5" rx="12" ry="6" style="fill:white;stroke:black;stroke-width:1" /> 
                            </svg>
                            <div>โสด</div>
                        </div>
                        <div style="display: flex; justify-content: center; margin-left: 15pt;">
                            <svg height="25" width="60" xmlns="http://www.w3.org/2000/svg">
                                <ellipse cx="15" cy="12.5" rx="12" ry="6" style="fill:white;stroke:black;stroke-width:1" /> 
                            </svg>
                            <div>สมรส</div>
                        </div>  
                        <div style="display: flex; justify-content: center; margin-left: 15pt;">
                            <svg height="25" width="60" xmlns="http://www.w3.org/2000/svg">
                                <ellipse cx="15" cy="12.5" rx="12" ry="6" style="fill:white;stroke:black;stroke-width:1" /> 
                            </svg>
                            <div>หย่า</div>
                        </div>
                    </div>
                    <div style="display: flex; margin-top: 20pt;">
                        <p>๔. ปัจจุบันเป็นข้าราชการ</p>
                        <div>........................................................................ตำเเหน่ง.....................................................</div>
                    </div>
                </div>
                <div>
                    <div>
                        ฝ่าย/กลุ่มงาน...................................................................กอง..................................................กรม..................................................
                    </div>
                    <div>
                        โทรศัพท์.................................................ดำรงตำแหน่งปัจจุบันเมื่อวันที่......................เดือน..................................พ.ศ....................
                    </div>
                    <div>
                        อัตรวเงินเดือนปัจจุบัน............................................บาท
                    </div>
                </div>
                <div style="margin-left: 10%;">
                    <div style="display: flex; margin-top: 20pt;"><p>๕. ขอโอนมาดำรงตำเเหน่ง</p>................................ระดับ...................................</div>
                </div>
                <div>ส่วนราชการ...............................................................................................................</div>
                <div style="margin-left: 10%;">
                    <div style="display: flex; margin-top: 20pt;"><p>๖. เหตุผลในการขอโอน คือ</p>............................................................................................</div>
                </div>
                <div>.....................................................................................................................</div>
                <div>และได้เเนบหลักฐานประกอบการโอนมาพร้อมนี้ด้วยเเล้ว จำนวน................ฉบับ (ไม่รวมใบสมัคร)</div>
                <div style="margin-left: 10%; display: flex; flex-direction: column; margin-top: 20pt;">
                    <p>๗. ประวัติส่วนตัว</p>
                    <div>เกิดวันที่......................เดือน............................พ.ศ............อายุ............ปี..............เดือน</div>
                </div>
                <div style="display: flex; flex-direction: row; width: 100%;">
                    <div style="padding-right: 5pt;">เลขประจำตัวประชาชน</div>
                    <div class="box">
                        <div class="list">2</div>
                        <div>-</div>
                        <div class="list">2</div>
                        <div class="list">2</div>
                        <div class="list">2</div>
                        <div class="list">2</div>
                        <div>-</div>
                        <div class="list">2</div>
                        <div class="list">2</div>
                        <div class="list">2</div>
                        <div class="list">2</div>
                        <div class="list">2</div>
                        <div>-</div>
                        <div class="list">2</div>
                        <div class="list">2</div>
                        <div>-</div>
                        <div class="list">2</div>
                    </div>
                    <div>เริ่มรับราชการเมื่อวันที่.................</div>
                </div>
                <div>เดือน...........................พ.ศ.............อายุราชการ...........ปี...........เดือน (นับถึงเดือน....................พ.ศ....................)</div>
                <div>ภูมิลำเนาเดิม (จังหวัด)......................... ที่อยู่ปัจจุบัน บ้านเลขที่..........หมู่ที่..........ตำบล/แขวง..........................</div>
                <div>โทรศัพท์บ้าน...........................................โทรศัพท์มือถือ...........................................</div>
                <div style="display: flex; margin-left: 70pt; margin-top: 20pt;">
                    <div style="display: flex; justify-content: center;">
                        <div class="flex-column-center">
                            <svg height="20" width="20" xmlns="http://www.w3.org/2000/svg">
                                <circle r="9" cx="10" cy="10" fill="white" stroke="black"/>
                            </svg>
                        </div>
                        <div class="flex-column-center" style="width: 150pt; margin-bottom: 5pt; margin-left: 10pt;">ไม่เป็นสมาชิก กบข. ประเภท</div>
                    </div>
                    <div style="display: flex; justify-content: center; margin-left: 30pt;">
                        <div class="flex-column-center">
                            <svg height="20" width="20" xmlns="http://www.w3.org/2000/svg">
                                <circle r="9" cx="10" cy="10" fill="white" stroke="black"/>
                            </svg>
                        </div>                       
                        <div class="flex-column-center" style="width: 80pt; margin-bottom: 5pt; margin-left: 10pt;">สะสม</div>
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <div class="flex-column-center">
                            <svg height="20" width="20" xmlns="http://www.w3.org/2000/svg">
                                <circle r="9" cx="10" cy="10" fill="white" stroke="black"/>
                            </svg>
                        </div>                       
                        <div class="flex-column-center" style="width: 150pt; margin-bottom: 5pt; margin-left: 10pt;">ไม่สะสม</div>
                    </div>
                </div>
                <div style="display: flex; margin-left: 70pt; margin-top: 10pt;">
                    <div style="display: flex; justify-content: center;">
                        <div class="flex-column-center">
                            <svg height="20" width="20" xmlns="http://www.w3.org/2000/svg">
                                <circle r="9" cx="10" cy="10" fill="white" stroke="black"/>
                            </svg>
                        </div>
                        <div class="flex-column-center" style="width: 150pt; margin-bottom: 5pt; margin-left: 10pt;">ไม่เป็นสมาชิก กบข.</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="document">
            <div style="text-align: center; margin-top: 20pt;">-๒</div>
            <div style="display: flex; margin-top: 20pt;">
                <p style="margin-left: 10%; width: 100%;">๘. วุฒิการศึกษา</p>
            </div>
            <div class="graduateTable">
                <table>
                    <thead>
                        <tr>
                            <th>ระดับ<br>การศึกษา</th>
                            <th>คุณวุฒิ</th>
                            <th>สาขาวิชา</th>
                            <th>สถาบันการศึกษา</th>
                            <th>ปีที่สำเร็จ<br>การศึกษา</th>
                            <th>เกรด<br>เฉลี่ย</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>ปริญญาตรี</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>ปริญญาโท</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>อื่นๆ</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <!-- <tr>
                            <td class="order"></td>
                            <td style="text-align: start;"></td>
                            <td class="amount1"></td>
                            <td class="amount2"></td>
                        </tr> -->
                    </tbody>
                </table>
            </div>
            <div style="display: flex; margin-top: 20pt;">
                <p style="margin-left: 10%; width: 22%;">๙. ประวัติการรับราชการ</p>
                <div>(จากเริ่มรับราชการจนถึงปัจจุบัน เเสดงเฉพาะที่ได้รับเเต่งตั้งให้ดำรงตำเเหน่ง</div>
            </div>
            <div>ในระดับสูงขึ้น เเต่ละระดับเเละการเปลี่ยนเเปลงนการดำรงตำเเหน่งในสายงานต่างๆ)</div>
            <div class="governmentTable">
                <table>
                    <thead>
                        <tr>
                            <th style="width: 15%;">วัน เดือน ปี</th>
                            <th>ตำแหน่ง</th>
                            <th style="width: 15%;">อัตราเงินเดือน</th>
                            <th>สังกัด</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="display: flex; margin-top: 20pt;">
                <p style="margin-left: 10%; width: 100%;">๑๐. ประวัติการฝึกอบรมเเละดูงาน</p>
            </div>
            <div class="trainTable">
                <table>
                    <thead>
                        <tr>
                            <th style="width: 15%;">ช่วงระยะเวลา<br>(ปี พ.ศ.)</th>
                            <th>หลักสร</th>
                            <th style="width: 20%;">หน่วยงานที่จัด</th>
                            <th style="width: 20%;">สถานที่</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="document">
            <div style="text-align: center; margin-top: 20pt;">-๓</div>
            <div style="display: flex; margin-top: 20pt;">
                <p style="margin-left: 10%; width: 100%;">๑๑. หน้าที่ความรับผิดชอบของตำเเหน่งปัจจุบัน</p>
            </div>
            <div>.....................................................................................</div>
            <div>.....................................................................................</div>
            <div>.....................................................................................</div>
            <div>.....................................................................................</div>
            <div>.....................................................................................</div>
            <div style="display: flex; margin-top: 20pt;">
                <p style="margin-left: 10%; width: 100%;">๑๒. ผลงานหรือผลการปฏิบัติงานที่ผ่านมา เเละผลงานอื่นที่เเสดงให้เห็นถึงความรู้ความสามารถพิเศษที่เป็น</p>
            </div>
            <p>ประโยชน์ต่อการปปฏิบัติงานในตำแหน่งที่ขอโอนมารับราชการสังกัดศูนย์อำนวนการรักษาผลประโยชน์ของชาติทางทะเล</p>
            <div style="display: flex; margin-top: 15pt;">
                <p style="margin-left: 15%; width: 100%;" >๑๒.๑ ผลงานหรือผลการปฏิบัติงานที่ผ่านมา (ผลงานย้อนหลัง ๒ ปี)</p>
            </div>
            <div>.....................................................................................</div>
            <div>.....................................................................................</div>
            <div>.....................................................................................</div>
            <div style="display: flex; margin-top: 15pt;">
                <p style="margin-left: 15%; width: 100%;">๑๒.๒ ผลงานที่เคยเสนอเพื่อเลื่อนตำเเหน่ง</p>
            </div>
            <div>.....................................................................................</div>
            <div>.....................................................................................</div>
            <div>.....................................................................................</div>
            <div style="display: flex; margin-top: 15pt;">
                <p style="margin-left: 15%; width: 100%;">๑๒.๓ ผลงานอื่นที่แสดงให้เห็นถึงความรู้ความสามารถพิเศษที่เป็นประโยชน์ต่อการปฏิบัติงาน</p>
            </div>
            <div>.....................................................................................</div>
            <div>.....................................................................................</div>
            <div>.....................................................................................</div>
            <div style="display: flex; margin-top: 20pt;">
                <p style="margin-left: 10%; width: 100%;">๑๓. มีประวัติต้องโทษในคดีอาญา คดีเเพ่ง เเละทางวินัย หรือไม่</p>
            </div>
            <div style="margin-left: 15%;">    
                <div style="display: flex; flex-direction: row; justify-content: space-between;">
                    <div style="width: 50%;">( ) เคยถูกลงโทษทางวินัย</div>
                    <div style="text-align: start; width: 50%;">( ) ไม่เคยถูกลงโทษทางวินัย</div>
                </div>
                <div style="display: flex; flex-direction: row; justify-content: space-between;">
                    <div style="width: 50%;">( ) อยู่ระหว่างถูกดำเนินทางวินัย</div>
                    <div style="text-align: start; width: 50%;">( ) ไม่อยู่ระหว่างถูกดำเนินทางวินัย</div>
                </div>
                <div style="display: flex; flex-direction: row; justify-content: space-between;">
                    <div style="width: 50%;">( ) อยู่ระหว่างถูกดำเนินคดีอาญา</div>
                    <div style="text-align: start; width: 50%;">( ) ไม่อยู่ระหว่างถูกดำเนินคดีอาญา</div>
                </div>
                <div style="display: flex; flex-direction: row; justify-content: space-between;">
                    <div style="width: 50%;">( ) อยู่ระหว่างถูกดำเนินคดีเเพ่ง</div>
                    <div style="text-align: start; width: 50%;">( ) ไม่อยู่ระหว่างถูกดำเนินคดีเเพ่ง</div>
                </div>
            </div>
            <div style="display: flex; margin-top: 20pt;">
                <p style="margin-left: 10%; width: 100%;">๑๔. เคยทำความดีความชอบเป็นพิเศษในกรณีใดบ้าง/เคยได้รับรางวัล หรือประกาศเกียรติคุณดีเด่นหรือไม่</p>
            </div>
            <p>(เช่น ข้าราชการพลเรือนดีเด่น เป็นต้น)</p>
            <div>.....................................................................................</div>
            <div>.....................................................................................</div>
            <div>.....................................................................................</div>
        </div>
        <div class="document">
            <div style="text-align: center; margin-top: 20pt;">-๔</div>
            <div style="display: flex; margin-top: 20pt;">
                <p style="margin-left: 10%; width: 100%;">๑๕. ประวัติการเลื่อนเงินเดือนย้อนหลัง ๒ ปี</p>
            </div>
            <div style="margin-left: 15%;">
                <div>(๑) การเลื่อนเงินเดือนรอบ ๑ ต.ค./.................ระดับ.......................</div>
                <div>(๒) การเลื่อนเงินเดือนรอบ ๑ เม.ย./.................ระดับ.......................</div>
                <div>(๓) การเลื่อนเงินเดือนรอบ ๑ ต.ค./.................ระดับ.......................</div>
                <div>(๔) การเลื่อนเงินเดือนรอบ ๑ เม.ย./.................ระดับ.......................</div>
            </div>
            <div style="display: flex; margin-top: 20pt;">
                <p style="margin-left: 10%; width: 100%;">๑๖. ประวัติการถูกงดเลื่อนเงินเดือน (ถ้ามี) ในปีใด เเละระบุสาเหตุ</p>
            </div>
            <div style="margin-left: 15%;">
                <div>( ) เคย ปี.........สาเหตุ........................................</div>
                <div>( ) ไม่เคย</div>
            </div>
            <div style="display: flex; margin-top: 20pt;">
                <p style="margin-left: 10%; width: 100%;">๑๗. มีภาระผูกพันกับทางราชการหรือไม่</p>
            </div>
            <div style="margin-left: 15%; display: flex; flex-direction: row;">
                <div>( ) มี ได้เเก่</div>
                <div style="margin-left: 10pt;">
                    <div>(๑).........................................................</div>
                    <div>(๒).........................................................</div>
                    <div>(๓).........................................................</div>
                </div>
            </div>
            <div style="margin-left: 15%;">( ) ไม่มี</div>
            <div style="display: flex; margin-top: 20pt;">
                <p style="margin-left: 10%; width: 100%;">๑๘. บุคคลที่สามารถติดต่อได้ (กรณีฉุกเฉิน)</p>
            </div>
            <div style="margin-left: 10%;">ชื่อ (นาย/นาง/นางสาว)...............................นามสกุล..................................</div>
            <div>
                เกี่ยวข้องเป็น............................โทรศัพท์.............................มือถือ.............................
            </div>
            <div style="margin-top: 20pt;">
                <div style="margin-left: 10%;">ข้าพเจ้าขอรับรองว่า ข้าพเจ้าไม่เป็นผู้ที่อยู่ระหว่างถูกกล่าวหา หรือถูกสอบสวนทางวินัยเเละคดีอาญาไม่ว่ากรณีใดๆ</div>
                <div>
                    เเละขอรับรองว่าถ้อยคำที่ให้ไว้นี้เป็นจริงทุกประการ เเละข้าพเจ้ายินยอมให้ ศรชล. ตรวจสอบประวัติบุคคลจากหน่วยงานที่เกี่ยงข้อง
                    เเละยอมรับผลการพิจารณาหรือข้อวินิจฉันอื่นใด ของศูนย์อำนวยรักษาผลประโยชน์ของชาติทางทะเล โดยจะไม่โต้เเย้งหรือเรียกร้องสิทธิใดๆ ทั้งสิ้น จึงลงลายมือชื่อไว้เป็นหลักฐาน
                </div>
            </div>
            <div style="margin-left: 10%; margin-top: 10pt;">จึงเรียนมาเพื่อโปรดพิจารณา</div>
            <div style="margin-left: 50%; width: 50%; text-align: center;">
                <div style="margin-top: 20pt;">ขอเเสดงความนับถือ</div>
                <div style="margin-top: 20pt;">ลงชื่อ....................................</div>
                <div>(....................................)</div>
                <div>ตำเเหน่ง.......................................</div>
                <div>วัน/เดือน/ปี................................</div>
                <div>ผู้ขอโอน</div>
            </div>
        </div>
    </body>
</html>