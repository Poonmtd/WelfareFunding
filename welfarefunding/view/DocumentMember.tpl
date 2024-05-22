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
            color: black; 
            text-align: center;
        }
        .text-end{
            text-align: end;
        }
        .text-center{
            text-align: center;
        }
        .text{
            text-align: justify;
            /* display: flex; */
        }
        .line{
            border-bottom: solid 0.5pt;
            text-align: center;
        }
        .signed{
            margin-left: 40%;
            text-align: center;
            margin-top: 20px;
            align-items: center;
            justify-content: center;
        }

    </style>
    <body>
        <div class="document">
            <!-- <div>Citizen ID: {{{citizenID}}}</div>
            <div>Name: {{uid.firstName}} {{uid.lastName}}</div> -->
            <div class="topic" style="font-size: 20pt;">ใบสมัครสมาชิก</div>
            <div class="content">
                <div class="text-end" style="display: flex; justify-content: end; margin-left: 75%; width: 100%;">เลขทะเบียนสมาชิก<div class="line" style="width: 10%;">{{{memberNumber}}}</div></div>
                <div class="text-center" style="display: flex; justify-content: center;">กองทุนสวัสดิการชุมชนตำบลทรัพย์อนันต์</div>
                <div class="text-end" style="text-align: end;">เขียนที่ทำการกองทุนสวัสดิการชุมชน</div>
                <div class="text-end" style="display: flex; margin-left: 54%; width: 100%;">วันที่<div class="line" style="width: 10%;">{{{date}}}</div>เดือน<div class="line" style="width: 15%;">{{{month}}}</div>พ.ศ.<div class="line" style="width: 10%;">{{{year}}}</div></div>
                <div style="display: flex; margin-top: 10pt; margin-bottom: 10pt;">เรียน ประธานคณะกรรมการกองทุนสวัสดิการชุมชน<div class="line" style="width: 20%;">ตำบลทรัพย์อนันต์</div></div>
                <div class="text">
                    <div style="display: flex;">
                        ข้าพเจ้า<div class="line" style="width: 40%;">{{uid.firstName}}</div>
                        นามสกุล<div class="line" style="width: 40%;">{{uid.lastName}}</div>
                    </div>
                    <div style="display: flex;">
                        เลขประจำตัวประชาชน<div class="line" style="width: 30%;">{{{citizenID}}}</div>
                        อายุ<div class="line" style="width: 5%;">{{age}}</div>
                        ปี วัน/เดือน/ปี เกิด<div class="line" style="width: 20%;">{{{birthday}}}</div>
                    </div>
                    <div style="display: flex;">
                        บ้านเลขที่<div class="line" style="width: 8%;">{{addressNumber}}</div>
                        หมู่ที่<div class="line" style="width: 8%;">{{moo}}</div>
                        ซอย<div class="line" style="width: 15%;">{{alley}}</div>
                        ถนน<div class="line" style="width: 15%;">{{road}}</div>
                        ชุมชน<div class="line" style="width: 15%;">{{{community}}}</div>
                    </div>
                    <div style="display: flex;">
                        ตำบล/แขวง<div class="line" style="width: 15%;">{{subDistrictID}}</div>
                        อำเภอ<div class="line" style="width: 15%;">{{districtID}}</div>
                        จังหวัด<div class="line" style="width: 15%;">{{province}}</div>
                        โทรศัพท์<div class="line" style="width: 15%;">{{telephoneNumber}}</div>
                    </div>
                    <!-- ข้าพเจ้า......{{uid.firstName}}..............นามสกุล........{{uid.lastName}}............
                    <br>เลขประจำตัวประชาชน....................อายุ........ปี วัน/เดือน/ปี เกิด.............
                    <br>บ้านเลขที่............หมู่ที่............ซอย............ถนน............ชุมชน............
                    <br>ตำบล/แขวง............อำเภอ............จังหวัด............โทรศัพท์............ -->
                </div>
                <div style="text-indent: 30pt; text-align: justify; width: 95%;">
                    ข้าพเจ้าเข้าใจระเบียบ เเละวัตถุประสงค์ของกองทุนสวัสดิการชุมชนนี้ เเละขอสมัครเข้าเป็นสมาชิกของกองทุนโดย
                    ขอชำระเงินสมทบให้กับกองทุนวันละ 1 บาท หรือ 365 บาท/ปี และค่าสมัครสมาชิกแรกเข้า 20 บาท โดย
                    ไม่ขอรับเงินค่าสมัครแรกเข้าเเละเงินสมทบกองทุนคืนแต่ขอรับสวัสดิการตามสิทธิที่พึงได้รับตามกำหนดไว้ในข้อบังคับ/ระเบียบกองทุน 
                </div>
                <div class="text">
                    <div style="display: flex; text-indent: 30pt; text-align: justify;">
                        หากข้าพเจ้าถึงแก่กรรม ข้าพเจ้าขอมอบผลประโยชน์ที่เกิดขึ้นจากกองทุนสวัสดิการชุมชนตำบลทรัพย์อนันต์
                    </div>
                    <div style="display: flex;">
                        ให้เเก่<div class="line" style="width: 40%;">{{grantee_one}}</div>
                        เลขที่บัตรประชาชน<div class="line" style="width: 30%;">{{citizenIDG1}}</div>
                    </div>
                    <div style="display: flex;">
                        อายุ<div class="line" style="width: 5%;">{{ageG1}}</div>ปี
                        วัน/เดือน/ปี เกิด<div class="line" style="width: 20%;">{{birthdayG1}}</div>
                        บ้านเลขที่<div class="line" style="width:5%;">{{addressNumberG1}}</div>
                        หมู่ที่<div class="line" style="width: 5%;">{{mooG1}}</div>
                        ซอย<div class="line" style="width: 10%;">{{alleyG1}}</div>
                        ถนน<div class="line" style="width: 10%;">{{roadG1}}</div>
                    </div>
                    <div style="display: flex;">
                        ชุมชน<div class="line" style="width: 10%">{{communityG1}}</div>
                        ตำบล/แขวง<div class="line" style="width: 10%;">{{subDistrictIDG1}}</div>
                        อำเภอ<div class="line" style="width: 10%;">{{districtIDG1}}</div>
                        จังหวัด<div class="line" style="width: 10%;">{{provinceG1}}</div>
                        โทรศัพท์<div class="line" style="width: 20%;">{{telephoneNumberG1}}</div>
                    </div>
                   <div style="display: flex;">
                        ซึ่งมีความเกี่ยวข้องเป็น<div class="line" style="width: 20%;">{{relationships}}</div>ของข้าพเจ้า เป็นผู้รับผลประโยชน์
                   </div>
                   <div style="display: flex; text-indent: 30pt;">ในการนี้ ข้าพเจ้าได้แนบสำเนาบัตรประชาชนของตนเองและผู้รับผลประโยชน์มาพร้อมนี้</div>
                    <div class="signed">
                        <div style="display: flex; justify-content: center;">
                            ลงชื่อ<div class="line" style="width: 60%;"></div>ผู้สมัคร
                        </div>
                        <div style="display: flex; justify-content: center;">
                            ( <div class="line"style="width: 50%;">{{uid.firstName}} {{uid.lastName}}</div> )
                        </div>
                    </div>
                    <div style="margin-top: 15pt;">คำรับรองของคณะกรรมการประจำชุมชน/เทศบาล</div>
                    <div style="text-indent: 30pt;">ข้าพเจ้าขอรับรอง ข้อความตามใบสมัครว่าเป็นความจริง</div>
                    <div class="signed">
                        <div style="display: flex; justify-content: center;">
                            ลงชื่อ<div class="line" style="width: 60%;"></div>ผู้รับรอง
                        </div>
                        <div style="display: flex; justify-content: center;">
                            ( <div class="line"style="width: 60%;">{{roleFundingMember.firstName}}  {{roleFundingMember.lastName}}</div> )
                        </div>
                    </div>
                    <div class="signed">
                        <div style="display: flex; justify-content: center;">
                            คณะกรรมการประจำชุมชน<div class="line" style="width: 30%;">ตำบลทรัพย์อนันต์</div>
                        </div>
                        <div style="display: flex; justify-content: center;">
                            ลงวันที่<div class="line" style="width: 40%;">{{{date}}} {{{month}}} {{{year}}}</div>
                        </div>
                    </div>
                    <div style="margin-top: 15pt;">มติคณะกรรมการบริหาร</div>
                    <div style="text-indent: 30pt;">
                        ในการประชุมคณะกรรมการบริหาร ชุดที่_____ ครั้งที่_____  วันที่______เดือน____________ปี_______
                    </div>
                    <div style="display: flex; width: 100%;">
                        พิจารณาเเล้ว เห็นว่าผู้สมัครมีคุณสมบัติ 
                        <svg style="margin-top: 2pt; margin-left: 5pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                            <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                        </svg> ครบถ้วนถูกต้อง
                        <svg style="margin-top: 2pt; margin-left: 5pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                            <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                        </svg>ไม่ถูกต้อง ตามระเบียบกองทุน
                    </div>
                    <div style="display: flex; width: 100%;">
                        จึงมีมติ
                        <svg style="margin-top: 2pt; margin-left: 5pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                            <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                        </svg> รับ
                        <svg style="margin-top: 2pt; margin-left: 5pt;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15pt"><title>checkbox-blank-outline</title>
                            <path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" />
                        </svg>ไม่รับ  เข้าเป็นสมาชิกกองทุนสวัสดิการชุมชนตำบลทรัพย์อนันต์
                    </div>
                    <div class="signed">
                        <div style="display: flex; justify-content: center;">
                            ลงชื่อ<div class="line" style="width: 60%;"></div>ผู้รับรอง
                        </div>
                        <div style="display: flex; justify-content: center;">
                            ( <div class="line"style="width: 60%;">{{rolenamechairman.firstName}}  {{rolenamechairman.lastName}}</div> )
                        </div>
                    </div>
                    <div class="signed">
                        <div style="text-align: center;">
                            ประธานกองทุน
                        </div>
                        <div style="display: flex; justify-content: center;">
                            ลงวันที่<div class="line" style="width: 40%;">{{{date}}} {{{month}}} {{{year}}}</div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </body>
</html>