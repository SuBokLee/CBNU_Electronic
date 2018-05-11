class HomeController < ApplicationController
  # 충북대찌릿test
  require 'unirest'

  
    def keyboard_init
        msg =
            {
              type: "buttons",
              buttons: ["전자공학부 홈페이지", 
              "종합정보시스템",
              "바압",
              "소자정보",
              "사용법",  
              "전자상식(공사중)",
              "충북대위키(랜덤)",   
              "충북대학교 어둠의게시판"]
            }
        render json: msg, status: :ok
    end
    
    def self.index #날씨
      # url = 'api.openweathermap.org/data/2.5/weather?id=1845604&appid=8354ba5e11c5b42f5cd7edd3b2f2f6c0'
      response = Unirest.get 'https://api.openweathermap.org/data/2.5/weather?id=1845604&appid=8354ba5e11c5b42f5cd7edd3b2f2f6c0&units=metric', 
                        headers:{ "Accept" => "application/json" }

                        
      # puts(response.code)
      # puts(response.body) # Parsed body
      @temperature = response.body['main']['temp']
      @supdo = response.body['main']['humidity']
      # puts(temperature)      
      return @temperature
    
    end
    
    def self.ygg1   ##양진재 아침
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'    # [2009, 1, 10] * '-' # => "2009-1-10"     
      # dayday=time1.year+'-'+time1.month+'-'+time1.day
      # bok_url = 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date=2018-04-18'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
                          # parameters:{ :type => "", :date => dayday }
                          # puts(dayday)
                          
      # time1.to_a
      # time1.in_time_zone("Seoul")

      # if time1.hour < 10
      #   a=0                 #아침00시~ 10시까지 아침메뉴
      #   elsif time1.hour < 14
      #   a=1                   #난조빱이라 안되게따
      # else
      #   a=2
      # end
        
      # puts(response.body["stores"][0]["menus"][0]["description"])                          
      @meal1 = response.body["stores"][0]["menus"][0]["description"]
      # @meal = response.body["stores"]["menus"]["description"]
      # puts(response.body["stores"]["menus"].class)
      return @meal1
    end
    
    def self.ygg2 #양진재 점심
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal2 = response.body["stores"][0]["menus"][1]["description"]
      return @meal2
    end
    
    def self.ygg3 #양진재 저녁
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal3 = response.body["stores"][0]["menus"][2]["description"]
      return @meal3
    end    
    
    def self.ysg1  #양성재 아침
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal4 = response.body["stores"][1]["menus"][0]["description"]
      return @meal4
    end
    
    def self.ysg2  #양성재 점심
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal5 = response.body["stores"][1]["menus"][1]["description"]
      return @meal5
    end    
    
    def self.ysg3  #양성재 저녁
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal6 = response.body["stores"][1]["menus"][2]["description"]
      return @meal6
    end    
    
    def self.gsg1 #개성재 아침
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @gsg1 = response.body["stores"][2]["menus"][0]["description"]
      return @gsg1
    end    
    
    def self.gsg2  #개성재 점심
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @gsg2 = response.body["stores"][2]["menus"][1]["description"]
      return @gsg2
    end    
    
    def self.gsg3  #개성재 저녁
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @gsg3 = response.body["stores"][2]["menus"][2]["description"]
      return @gsg3
    end
    
    def self.sh1   #신학1층 주먹밥[8:30~10:50]
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal21 = response.body["stores"][3]["menus"][0]["description"]
      return @meal21
    end    
    
    def self.sh2 #신학1층 백반
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal22 = response.body["stores"][3]["menus"][1]["description"]
      return @meal22
    end    
    
    def self.sh3   #신학1층 백반특식
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal23 = response.body["stores"][3]["menus"][2]["description"]
      return @meal23
    end    

    def self.sh4   #일품[11:00~14:30]
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal24 = response.body["stores"][3]["menus"][3]["description"]
      return @meal24
    end    

    def self.sh5   #양식[11:00~14:30]
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal25 = response.body["stores"][3]["menus"][4]["description"]
      return @meal25
    end    

    def self.sh6   #분식[11:00~14:30]
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal26 = response.body["stores"][3]["menus"][5]["description"]
      return @meal26
    end    
    
    def self.sh7   #저녁
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal27 = response.body["stores"][3]["menus"][6]["description"]
      return @meal27
    end        
    
    def self.sh8   #면코너[10:00~17:30]
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal28 = response.body["stores"][3]["menus"][7]["description"]
      return @meal28
    end        
    
    def self.sh9   #간식코너
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal29 = response.body["stores"][3]["menus"][8]["description"]
      return @meal29
    end    


    def self.bb1   #별빛레스토랑 신학2층
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @bb11 = response.body["stores"][4]["menus"][0]["description"]
      return @bb11
    end   
    
    def self.uh1   #은하수식당 점심
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @uh11 = response.body["stores"][5]["menus"][0]["description"]
      return @uh11
    end   
    
    def self.uh2   #은하수식당 저녁
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @uh22 = response.body["stores"][5]["menus"][1]["description"]
      return @uh22
    end       
    
    

      
        received_data = JSON.parse(request.raw_post)
        user_key = received_data["user_key"]
        type_name = received_data["type"]
        content = received_data["content"]
        
        # puts(user_key, type_name, content)
        
        main_menu = ["전자공학부 홈페이지",
        "종합정보시스템",
        "바압",
        "소자정보", 
        "사용법",
        "전자상식(공사중)",
        "충북대위키(랜덤)",
        "충북대학교 어둠의게시판"]
        
        food_menu =["■처음으로",
        "양진재",
        "양성재",
        "개성재",
        "한빛식당(신학1층)",
        "별빛레스토랑(신학2층)",
        "은하수식당(교직원식당)"
        ]
        
        food_when1 =["■처음으로",  #양진재 아점저
        "양진재 아침",
        "양진재 점심",
        "양진재 저녁"]

        food_when2 =["■처음으로",  #양성재 아점저
        "양성재 아침",
        "양성재 점심",     
        "양성재 저녁"]

        food_when3 =["■처음으로",  #개성재 아점저
        "개성재 아침",
        "개성재 점심",     
        "개성재 저녁"]
        
        food_when4 =["■처음으로",  #신학 메뉴
        "주먹밥[8:30~10:50]",
        "백반[11:00~14:00]",     
        "백반특식[11:00~14:00]",
        "일품[11:00~14:30]",
        "양식[11:00~14:30]",
        "분식[11:00~14:30]",
        "저녁[16:30~18:30]",
        "면코너[10:00~17:30]",
        "간식코너[10:00~17:30]"]      
        
        food_when5 =["■처음으로",  #신학 2층 별빛레스토랑
        "별빛레스토랑 점심[11:30~14:00]"]     
        
        food_when6 =["■처음으로", #은하수식당
        "은하수식당 점심[11:30~13:30]",
        "은하수식당 저녁[17:30~19:00]"]
        
        
        circuit_menu = ["■처음으로",
                "2114 / 1024 x 4 SRAM",
                "2716 / NMOS 128K 16K x 8 UV EPROM",
                "4001 / 4001B / Quad 2 Input NOR Buffered Gate",
                "4011 / Quad 2-Input NAND Buffered Series",
                "4050 / 4050B / Hex Non-Inverting Buffer",
                "4520 / 4520B / Dual 4-Bit Binary Counter",
                "7400 / 74LS00 / Quad 2-Input NAND Gate",
                "7402 / 74LS02 / Quad 2-Input Nor Gate", 
                "7403 / 74LS03 / Quad 2-Input Nand Gate", 
                "7404 / 74LS04 / Hex Inverter",
                "7405 / 74LS05 / Hex Inverter",
                "7406 / 74LS06 / Hex Inverted Buffers with OC Outputs",
                "7408 / 74LS08 / Quad 2-Input AND Gate",
                "7410 / 74LS10 / Triple 3-Input NAND Gate",
                "7411 / 74LS11 / Triple 3 Input AND Gate",
                "7420 / 74LS20 / Dual 4-Input NAND Gate",
                "7421 / 74LS21 / Dual 4-Input Positive AND Gate",
                "7432 / 74LS32 / Quad 2-Input OR Gate",
                "7442 / 74LS42 / BCD to Decimal Decoder",
                "7447 / 74LS47 / BCD to 7-segment Decoders/Drivers",
                "7472 / 74LS72 / AND-gated JK FF with Preset and Clear",
                "7474 / 74LS02 / D Flip-Flop",
                "7476 / 74LS76 / Dual Master Slave J-K F-F",
                "7486 / 74LS86 / Quad 2-Input Exclusive-OR Gate",
                "7489 / 74LS89 / 64 Bit RAM",
                "7490 / 74LS90 / Decade and Binary Counters",
                "7493 / 74LS93 / Decade and Binary Counters",
                "74121 / 74LS121 / One-Shot with Clear and Complementary Outputs",
                "74138 / 74LS138 / Decoder / Demultiplexer",
                "74151 / 74LS151 / Data Selectors / Multiplexers",
                "74153 / 74LS153 / Data 4-Line to 1-Line Data Selectors / Mux",
                "74164 / 74LS164 / 8 BIT SIPO SHIFT REGISTER",
                "74169 / 74LS169 / 4-Bit Up / Down Binary Counter",
                "74390 / 74LS390 / Dual 4-Bit Decade Counter",
                "1N4001 / Diode",#여기부터
                "1N4002 / Diode",
                "2N2222 / Transister",
                "CA3046 / Transister",
                "CD4007 / Transister",
                "MC14007UB / Dual Complementary Pair Plus Inverter",#여기까지 추가
                "FND507 / 7segment",
                "LM555 / timer",
                "LM741 / Single Operational Amplifer",
                "8p Dip Switch",
                "라즈베리파이",
                "아두이노",
                "검색(AllDataSheet)"]
                
        use_menu = ["■처음으로",
                  "저항 읽는법",
                  "커패시터 읽는법",
                  "인덕터 읽는법",
                  "브래드보드 사용법",
                  "가변저항 사용법",
                  "함수발생기 사용법",
                  "오실로스코프 사용법",
                  "아날로그 멀티미터(테스터기) 사용법",
                  "디지털 멀티미터 사용법",
                  "전원공급기 사용법",
                  "납땜하는 방법",
                  "피스파이스 사용법",
                  "MATLAB 사용법"]
                  
        formula_menu = ["■처음으로", 
        "단위",
        "각종상수들",   #"빛의 속도",입실론0...,전하의질량
        "주기율표",
        "반도체8대공정",
        "미적분공식(공사중)",
        "삼각함수공식(공사중)", #고딩수학공식들묶어서 등비수열, 근의공식
        "라플라스 변환(공사중)",
        "푸리에 급수/변환(공사중)",
        "등비수열 공식(공사중)",
        "근의 공식(공사중)",
        "오일러 공식(공사중)", 
        "Y-Δ 변환(공사중)",
        "R,L,C관계식(공사중)",
        "페이저(공사중)",
        "데시벨(공사중)",
        "콘볼루션(공사중)",
        "반도체전류공식(공사중)",
        "플립플롭 진리표(공사중)",
        "가우스의법칙(공사중)",
        "맥스웰 방정식(공사중)",
        "왼손,오른손법칙(공사중)",
        "계속 추가할 예정(처음으로)"
        ]
        
        random_reply = ["충북대학교의 표어는 개신(開新, NOVA APERIO), 건학이념은 진리, 정의, 개척.",
        
        "거점국립대 중에서 제주대 다음으로 학생 수가 적다. 다른 거점국립대의 학생수가 2만명 초반~3만명 근접인데에 비하여 심하게 적은 학생수이다. 기본적으로 충북 인구가 적은데다가 전통적으로 청주는 청주대, 서원대, 교원대 등 규모있는 4년제 대학이 많은 것이 이유로 보인다.",
        
        "1951년 도립 청주초급농과대학으로 개교하여, 1963년 국립 충북대학으로 개편되었다.",
        
        "2012년까지만해도 기숙사에 점호가 있었다. 월~목 밤 12시 통금으로, 이 시간이 되면 층장이 인원점검을 하는 식이었다. 그러다 2013년부터 점호를 없���고 통금시간도 새벽 1시로 변경되었다.",
        
        "서울대학교를 제외한 국립대학 총장은 공무원으로서 장관에 준하는 대우를 받는다.",
        
        "2018년 4월 12일 직선제로 치러진 차기 충북대 총장 선거에서 법학전문대학원 김수갑(56) 교수가 임용후보자로 당선됐다.",
        
        "2012년 2학기부터 N14(구 56동)에서 강의하는 교양과목에 전자출결이 도입되었다. 강의실 앞에서 학생증을 찍고 교수가 인원수를 확인하는 식이다. 전자출결 도입으로 대리출석이 어려워 질 듯 싶다. 출결기가 고장나는 일도 종종 있어서 교수도 학생도 귀찮기만 하다. 현재는 사용되지 않는 듯 하다.",
        
        "기존 학칙에는 재수강 상한선제와 학점포기제도가 없었고 전공과목은 절대평가로 하였으나, 2011년에 전공과목을 상대평가로 전환하고 2012학년도 부터 재수강 상한선제와 학점포기제도가 도입되었다. 이에 따라 C+이하인 과목부터 재수강이 가능하게 되었으며 재수강시 최고로 받을 수 있는 학점은 B+이다. 또한 7학기(4학년 1학기)때 최대 3학점 과목 1개에 한하여 학점포기가 가능였다. 하지만 2014년 9월 1일자로 학점포기제도가 사라졌다. 추가적으로 2011년 겨울방학에 전공과목의 신청은 해당 학년 학생들의 수강신청 기간에 우선적으로 받는 규범이 시행되기도 하였다. 2017년부터 재수강시 최고로 받을 수 있는 학점이 A0로 상향되었다.",
        
        "2016년에 비사범대 학사과정을 대상으로 하는 교직과정이 D등급 평가를 받아, 선발인원을 50% 감축하게 되었다.",
        
        "이전 정문은 1982년 5월 26일 완공되었으며, 전형적인 80년대 건축양식으로 대학교 정문 치고는 단조롭다는 지적을 많이 받았다. 학교 구성원들의 의견을 모은 뒤 2014년 개신지구 우수저류시설 공사를 즈음해 완전히 철거되었고, 일부 벽돌과 현판, 기와 등이 학교 박물관에 보존되었다.",
        
        "새로운 정문은 2016년 3월부터 새 정문 건축을 시작, 같은 해 5월 26일 완공되었다.",
        
        "법학전문대학원(N2) : 정문을 들어오자 마자 바로 옆에 있는 하얀색의 크고 아름다운 건물이다. 로스쿨 유치를 확정하자 공사를 시작하였으며 2012년 초에 완공되었다. 준공하자마자 현 생활과학대학 제2관 건물에 있던 법학전문대학원(기존 법과대학)이 이곳으로 옮겨왔다. 과거 법대 건물은 그 열악하기가 전국 로스쿨 중 최고 수준이라 거기서 공부하던 3기(2011년 입학)의 자퇴율이 너무 높아서, 4기는 면접을 다른 건물에서 봤다는 이야기가 있다.",
        
        "N14 : 경영대, 테니스장, 미술관과 인접해있는 건물이다. N14(건물번호)라고 흔히 불린다. 2009년에 완공되었다. 이 건물이 생기기 이전에는 교양강의 대부분을 각 단과대학 강의실에서 했으나, 완공 이후 교양강의 대부분을 이곳에서 한다. 교수연구실 일부를 제외하고 전부 강의실로만 구성되어 있고, 신식 건물이라 단과대 건물에 비하면 시설이 매우 좋은 편���다. 다만 일부 강의실에 비치된 3명씩 앉는 책상이 좀 불편한 점이 있고 냉난방 장치가 중앙제어 시스템이라 여름엔 무지하게 덥다.반면 겨울엔 히터를 잘 틀어주는 편이다.(어?)",
        
        "N14 : 인문사회관이 지어진 취지는 사실 노후된 경영대 건물을 대체하기 위함이었다. 그 숨은 증거로, 3층 왼편에 창문을 향해 길이 나 있는 괴상한 구조가 있다. 사실 인문사회관은 테니스장-경영대 건물 바로 맞은편-에 위치하여 경영대와 구름다리로 연결되게끔 설게된 건물이기 때문이다. 결국 건물명은 인문사회관으로 결정되었으나, 3-4층은 경영대강의실로, 5-6은 경영대교수 연구실로 사용되고 있다. 경영대 모 교수는, 경영대교수들이 노력해서 유치해온 예산으로 지은 건물에 타 단과대 교수들이 숟가락을 얹은 거라며 강의시간에 분통을 터트리기도.",
        
        "우체국은 다른 우체국과 같이 금융과 우편 업무를 함께했으나, 금융서비스 사용 저하로 2014년 6월경부터 우편취급국으로 전환하여 우편업무만 다루게 됐다.",
        
        "제2학생회관(구학,S14) : 지어진 지 약 40년 정도 된 오래된 건물이며, 드라마 제빵왕 김탁구에 이 건물이 나오기도 하였다. 영화에서 초반 4분경 금자(이영애)가 자수를 하여 경찰서 계단을 오르는 장면으로 촬영되었다.",
        
        "중앙도서관 : 제1학생회관 바로 앞에 있으며 맞은편에 사회과학대학이 있고 뒤쪽으로는 자연과학대학, 옆쪽에는 솔못이 있다. 1970년대만 하더라도 도서관 자리가 종합운동장 자리였다고 했으나, 1980년대 대규모 개발 이후로 운동장은 후문 쪽으로 옮겨가고 그 자리에 도서관을 건립했다. 지어진 지 30년이 넘은 건물이라 생각보다 노후가 심한 편이며, 특히 화장실 쪽은 답이 없던 상태였다. 그나마 2015년 1학기에 대대적으로 리모델링하여 많이 쾌적해졌다.",
        
        "중앙도서관 : 시설 노후화와 장서량 증가로 주차장 부지에 새로운 건물을 지어 확장한다고 하였다. 기존의 건물과 연결된 형태이다. 현재 2018년 12월 완공을 목표로 증축이 진행 중이다.",
        
        "중앙도서관 : 과거에는 1층 로비가 뻥 뚫려있는 이른바 광장형식으로 되어 있어 시끄러웠다. 리모델링 이후 로비에 공부하는 공간이 마련되고 나서 부터는 많이 조용해졌다.",
        
        "중앙도서관 : 제1학생회관 바로 앞에 있으며 맞은편에 사회과학대학이 있고 뒤쪽으로는 자연과학대학, 옆쪽에는 솔못이 있다. 1970년대만 하더라도 도서관 자리가 종합운동장 자리였다고 했으나, 1980년대 대규모 개발 이후로 운동장은 후문 쪽으로 옮겨가고 그 자리에 도서관을 건립했다. 지어진 지 30년이 넘은 건물이라 생각보다 노후가 심한 편이며, 특히 화장실 쪽은 답이 없던 상태였다. 그나마 2015년 1학기에 대대적으로 리모델링하여 많이 쾌적해졌다.",
        
        "과학기술도서관 : 자연대2호관과 자연대3호관(구 제3본관) 사이에 있는 도서관으로, 2012년에 완공되었다. 중앙도서관에 있던 과학기술관련 도서 상당 부분이 이 곳으로 옮겨왔다.",
        
        "형설관 : 중문과 정문에 인접해 있는 도서관 건물이다. 주변에 평생교육원과 예비군연대, 인재등용원, 국어교육원이 위치하고 있다. 서가 없이 열람실로만 이루어져 있는데, 4층은 현재는 열람실이 아니라 간호학과가 사용하는 공간이다. 또, 3층 열람실은 시험기간에만 개방한다. 1층에는 휴게실이 있어 각종 신문을 볼 수 있는 시설과 자판기, 컴퓨터, 프린터 등이 있다. 위치가 약간 외진 곳이라 이곳의 존재를 알지 못하는 신입생들도 더러 있지만, 이용객이 상대적으로 적고 공기의 질도 좋은 편이기 때문에 중앙도서관 대신 형설관을 이용하는 학생들이 알게 모르게 있다. 바로 앞에 편의점도 있고 중문과 가깝다는 지리적 이점도 있다. 원래는 차를 타고 가려면 언덕을 한 바퀴 돌아갔으나, 법학전문대학원 건물 신축으로 정문에서 올라갈 수 있는 길이 새로 생겼다.",
        
        "형설관 : 2, 3층 열람실은 1층 로비에 있는 열람석 지정 기계에서 학생증으로 자리를 정하고 앉아야 하지만, 1층은 그렇지 않아서 1층의 열람실은 외부인 출입이 가능하다. 그래서 중고등학생도 심심찮게 볼 수 있다. 단, 재학생의 중간시험 및 기말시험 기간에는 1층에도 외부인 출입이 안 된다.",
        
        "형설관 : 책상과 의자를 중앙도서관 열람실 개선공사와 함께 그쪽에서 남은 책상들을 선별하여 가져와 배치했다. 따라서 책상은 넓으나, 오래된 티가 난다. 낙서들도 있는데, 먼저 졸업한 이름모를 선배들의 감정을 읽을 수 있다.",
        
        "형설관 : 일반적으로 여름철 에어컨이 켜지는 시간은 9시~12시, 16시~18시이며, 겨울철 난방 시간은 일반적으로 8시~22시이다. 냉방이 안 되는 시간에 1층 열람실들은 각 열람실 별 자체에어컨을 켤 수 있다(13시~16시, 19시~22시).",
        
        "형설관 : 원래는 청주과학대학(현 한국교통대학교 증평캠퍼스) 산하의 건물이였으나, 학교가 이전하게 되면서 충북대 건물이 되었다.",
        
        "형설관 : 졸업생이나 본가가 청주에 있는 타대학 사람들과 지역민이 이용하는 경우도 많으므로, 이용객들의 증감으로 어떠한 시험이 임박했는지를 직감할 수 있다. 공무원 시험이 임박하여서는 밖에서 이야기를 나누는 소리도 줄어들고 이상하게 열람실이 좁아진 느낌이 들며, 여기저기서 한숨소리가 들리고, 새들조차도 소근소근 지저귀는 듯하다가, 시험이 끝나면 사람들이 순식간에 썰물처럼 빠져나간다. 그 후에 교원임용 시험을 치는 사람들이 몰려오며, 이 사람들은 또 다시 12월 초에 썰물처럼 빠져나간다. 그 사이사이에 계산기 치는 소리로 기사시험이 임박했음을 알 수 있다.",
        
        "형설관 : 4층은 2014년도부터 간호학과가 사용하고 있으며, 출입 역시 간호학과 학생증을 이용하지 않고서는 불가능하다. 화석들의 시험전용 건물에 웬 여학도들의 등장인가 하니, 240여 명의 학생들에 대한 강의시설을 다 확보하지 못한 간호학과가 학교 측에 강의할 공간을 요구하자 학교 측이 인심쓰듯 뜬금없이 제공한 공간이 형설관이어서라고 한다.",
        
        "솔못 : 대학본부와 중앙도서관 사이에 있는 연못이다. 원래는 광장 형태였으나 어른의 사정으로 광장을 없애버리고 인공적으로 만든 연못이다. 팔각정자도 마련되어 있어 동네 주민들이 이곳으로 많이 놀러 오고, 인근 학교에서 소풍을 오거나 졸업앨범 촬영을 하기도 한다.",
        
        "솔못 : 솔못에 잘못해서 거꾸로 빠지면 못솔이 되기도 한다.",
        
        "솔못 : 솔못을 중심으로 한 중앙도서관-경영대학-본부-바보계단을 잇는 마름모꼴 장소는 도인 상습 출몰 지역으로, 홀로 다니는 학우들의 주의를 요한다. 교내를 순찰하는 캡스에 신고하면 된다. 양성재로 올라가는 오르막길에도 자주 출몰했다고 한다.",
        
        "솔못 : 솔못에 거북이가 대략 14마리 정도 살고 있다. 가끔 여러 마리가 바위 위에서 일광욕하는 모습을 볼 수 있다.",
        
        "솔못 : 솔못에서 수달(!)을 목격했다는 제보가 있다.",
        
        "바보계단 : 자연과학대학 본건물 옆에 있는 계단이다. 계단 옆에 자전거도로가 설치되어 있으며 이 계단을 오르면 박물관과 구학생회관, 양성재 기숙사가 보인다. 원래는 특별한 명칭이 없었으나, 계단 구조가 좀 이상해서 학생들 사이에서는 바보계단이라고 불렸다. 계단의 높이가 낮은 데다 각각 단의 면적이 고르지 않고 들쑥날쑥했다. 이런 특성 때문에 계단을 오르는 것보다 옆의 자전거도로로 가는 게 더 편했다. 2014년 10월에 보수가 완료되었다.",
        
        "제1본관 : 충북대학교의 역사가 담겨 있는 상징적인 건물이기에 한동안 남겨두었으나, 점차 사용하지 않아 관리가 안되어 밤에 가면 좀 무서워보이기도 했다. 그 때문인지 2011년 축제 기간에는 귀신������� 집 건물로 이용되기도 했다.",
        
        "제1본관 : 2012년, 시설 노후로 안전등급 D급을 받아 사용중지 결정이 내려졌다. 그 후 2014년 학내 투표 결과 철거가 확정되었고, 2014년 12월에 철거되면서 역사 속으로 사라졌다.",
        
        "제1본관 : 2017년 9월 26일 개교 66주년, 종합대학 승격 40주년을 기념해 산림청에서 1억원을 지원받아 무궁화동산을 조성했다.",
        
        "탈마당(야외공연장,S8) : 양성재 기숙사 근처에 위치하고 있다. 정식 명칭은 야외공연장이며, 스테이지 및 넓은 공터로 구성되어 있다. 참고로 과거 동아리방 건물(11동)이 있던 자리는 탈마당이 아닌 풋살경기장. 무대시설 아래쪽은 공터로 되어있어 줄넘기나 가벼운 운동을 사람들이 ��� 많���. �����한 기숙사 가요제나 동아리 가요제, 일부 단과대 행사가 이곳에서 열리기도 한다.",
        
        "몽마르뜨언덕 : 학교 박물관 앞에 있는 계단 위의 넓은 잔디밭. 박물관과 전산정보원 사이에 있다. 주변이 나무로 둘려싸여 있으며, 넓고 평탄한 잔디밭이 조성되어 있기에 분위기가 좋다. 바로 옆의 이름 없는 잔디밭과 마찬가지로 술판이 벌어지는 장소 중 한 곳이다. 실제로 보면 무슨 경기장 같은 느낌. 주로 야구동아리의 외야연습지로 사용된다. 그리고 실제로도 체육대회의 예선전으로 자주 사용되며, 야간경기용 조명도 달려 있다. 넓이가 좁은지라 기껏해야 여자 피구나 발야구 정도이다",
        
        "잔디밭 : 탈마당 옆에 있는 경사 진 넓은 잔디밭. 주변에 나무 몇 개가 있으며, 커다란 소나무와 탑이 잔디밭 중앙에 있다. 고인돌도 있다(!) 봄에 꽃 필 때쯤 가 보면 참 예쁘다. 심심찮게 술판이 벌어지기도 한다. 위의 몽마르뜨 언덕이 기묘하게 외져있고, 또 잔디밭의 경사가 완만하고 넓게 펼쳐져 있어서인지 대다수의 학생들이 이곳을 몽마르뜨 언덕으로 착각하지만 이 곳은 몽마르뜨 언덕이 아니다!",
        
        "개성재 : 중문 바로 옆에 위치하고 있으며 진리관·정의관·개척관으로 구성되어 있다. 본래는 3건물 모두 남학생 전용이었으나, 양성재가 건립된 이후 3개 건물 중 개척관을 여학생 전용으로 변경하였다. 지어진 지 20년이 넘어, 시설은 매우 열악하다. 공용화장실에 방에도 슬리퍼를 신고 다니며 겨울에는 라디에이터 하나로 버텨야 하는 곳이다. 그나마 정의관은 2011년 여름 리모델링을 하여 바닥이 깔리고 에어컨이 설치되었으나 보일러가 깔리지 않았다. 나머지 기숙사도 리모델링 계획이 있으나 감감무소식이다가 2013년에 개척관과 진리관 모두 리모델링 되었다. 인문대, 사회대, 경영대와 인접해 있으며 위치가 중문 옆인지라 밤에는 좀 시끄럽다. 그나마 장점이라면 중문과 가까우면서 기숙사비가 가장 싸다. 그러나 리모델링한 후로는 양성재와 10만원정도밖에 차이가 안난다. 물론 개성재의 난방은 라디에이터 그대로다. 그래도 드디어 에어컨이 설치되었다는게 가장 큰 변경점. 그전에는 더운 여름날 선풍기(대부분의 학교 천장에 달려있는 그거)만 있어서 여름날 선풍기만 틀고 자야 했다.",
        
        "양성재 : 2017년부터는 중국 유학생들도 양성재에서 함께 생활한다. 근처를 다니다 보면 높은 확률로 중국어를 들을 수 있다.",
        
        "양성재 : 근처에 유학생 기숙사인 양현재가 자리잡고 있다. 그래서인지 외국인 유학생들을 많이 볼 수 있고 식당에서 밥을 먹다 보면 마치 외국에 유학온 기분을 느낄 수 있다.",
        
        "양진재 : 2015학년도 1학기에 개관한 BTL(민자유치) 기숙사이다. 의대와 공대 사이에 위치해 있으며, 명칭 공모전을 통해서 정해진 이름이다. 총 1400여명 수용할 수 있으며, 특이사항으로 기혼자 숙소가 마련되어 있다. 이 기숙사가 완공됨에 따라 기숙사 수용률이 14%에서 21%으로 대폭 늘어나게 되었다. 이 영향으로 기숙사 컷트라인이 전년도에 비해 확 낮아졌다.",
        
        "등용관 : 양성재 농구장 옆에 위치하고 있으며 본래는 여학생기숙사로 이용되다가, 유학생전용 기숙사로 운영 중이다. 여담으로 이 기숙사가 충북대에서 가장 먼저 건립된 기숙사다.",
        
        "전자정보대학 : 공과대학과 건물을 공유하고 있기에 딱히 공과대학 건물과 전정대 건물을 구분하여 지칭하지는 않는다. 공과대학 뿐 아니라 학연산 건물과도 구름다리로 연결되어 있어, 비를 맞지 않고도 움직일 수 있다. 건물이 ㅁ자형인데다 구름다리를 잘못타면 공대나 학연산으로 빠져서, 처음 방문하는 외부인이나 타과생들이 길을 잃곤 한다. 다른 단대도 으레 그렇듯, 각 과마다 구역이 있어서 해당되는 층에 강의실.동아리방.연구실 등이 모여 있다.",
        
        "농업생면환경대학 : 대학본부가 있는 사거리에서 오른쪽 길로 올라오면 보이는 건물들이다. 강의동과 실험동으로 구성되어 있으며 안쪽으로 깊숙히 들어가면 실험실, 비닐하우스(온실) 등이 있다. 강의동의 강의실들은 최근에 리모델링을 해서 깔끔한 편이다. 기존 강의동 뒤쪽으로 새로 건물을 지었고, 2013년 말경에 완공되었다. 하지만 대부분 연구실로 채워져서 일반 학생이 갈 일은 별로 없다.",
        
        "농업생명환경대학 : 부지가 법정동 기준으로는 복대2동에 있기는 한데, 그건 법정동 기준일 뿐 행정동 성화개신죽림동 경계에는 충북대학교 본캠퍼스 부지가 모두 포함된다. 우편물 주소를 '개신동 충북대학교 농업생명환경대학 ... '식으로 써도 어차피 충북대에 농생대는 하나 뿐이니 수취인 불명 처리가 되지는 않고, 이것이 큰 논란거리는 아니라고 할 수 있다. 충북대학교 부지가 넓다 보니 생긴 일.",
        
        "사범대학 : 개신문화관 왼쪽에 위치한 거대한 건물이다. ㅁ자 건물이긴 하지만 그 사이가 넓어 의외로 햇빛은 잘 드는 편이다. 다만, 건물 자체에서 이상한 한기가 든다. 건축 당시에는 4면 모두에서 출입이 가능한 독특한 열린 구조로 무슨 건축상도 받은 건물이지만, 정작 들어가서 살기에는 좋지 않은 구조라는 건 사범대생과 교직원들이 30년째 체험 중이다.",
        
        "사범대학 : 역사교육과와 사회교육과는 사범대학 건물에 없고, 구 법과대학 건물로 이사하였다. 그래도 역사교육과나 사회교육과 학생 학생증으로 사범대학 건물에 출입할 수 있고, 정독실 등 부대시설도 어느 정도 활용할 수 있다.",
        
        "생활과학대학 : 개신문화관에서 왼쪽으로 쭉 올라가다 보면 보인다. 생활과학대학 본관은 N20-1동, 제2관은 N19동 건물이다. 규모는 그리 크지 않고 구석진 곳에 있어서 찾기가 좀 어려운 면이 있다. 바로 옆에는 부속어린이집(N20-2)이 있다. 단과대 특성상 여학우들이 정말 많이 보인다.",
        
        "제1본관 : 양성재 기숙사와 제2학생회관(구학생회관) 사이에 위치했던 옛 대학본부 건물이다. 현 대학본부와 인문사회관을 완공하기 전까지는 강의실로 사용했었다.",
        
        "수의과대학 :  충북대학교 수의과대학은 청주에서 애완동물을 기르는 사람들이 동네 동물병원보다도 더 많이 찾는 가장 유명한 동물병원이기도 하다."
        ].sample
        
        
        
        
        
        if content == "전자공학부 홈페이지"
            # puts('start')
            # response = Unirest.get 'https://api.openweathermap.org/data/2.5/weather?id=1845604&appid=8354ba5e11c5b42f5cd7edd3b2f2f6c0&units=metric', 
            #             headers:{ "Accept" => "application/json" }
            # puts('second')
            # # puts(response.code)
            # # puts(response.body) # Parsed body
            # temperature = response.body['main']['temp']
            # puts('third')
            # puts(temperature)
            # puts(temperature.class)
            # print(temperature + 'fdsfds')
            # @supdo = response.body['main']['humidity']
            
            msg = {
              message: {
                    # "text": temperature.to_s(),
                    # "text": HomeController.index().to_s(),
                    # "text": HomeController.ygg1().to_s(),
                     "message_button": {
                        "label": "전자공학부",
                        "url": "http://elec.chungbuk.ac.kr/index.php"
                    }
              },
               
              keyboard: {
                type: "buttons",
                buttons: main_menu
              }
            }
            render json: msg, status: :ok
            
            
            
            
            
        elsif content == "종합정보시스템"
            msg = {
              message: {
                     "message_button": {
                      "label": "종합정보시스템",
                      "url": "http://gaesin.chungbuk.ac.kr/login.html"
                    }
              },
              
              keyboard: {
                type: "buttons",
                buttons: main_menu
              }
            }
            render json: msg, status: :ok
            
        elsif content == "바압"
            msg = {
              message: {
                "text":"항목을 선택해주세요."
              },
              
              keyboard: {
                type: "buttons",
                buttons: food_menu
              }
            }
            render json: msg, status: :ok
            
            
                              elsif content == "양진재"
                                  msg = {
                                    message: {
                                      "text":"평일아침 07:20~09:00\n평일점심 11:30~13:30\n평일저녁 17:30~19:10\n주말아침 08:00~09:00\n주말점심 12:00~13:00\n주말저녁 17:30~19:00"
                                    },
                                    
                                    keyboard: {
                                      type: "buttons",
                                      buttons: food_when1
                                    }
                                  }
                                  render json: msg, status: :ok                          
            
                                                    elsif content == "양진재 아침"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.ygg1().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when1
                                                          }
                                                        }
                                                        render json: msg, status: :ok            
            
                                                    elsif content == "양진재 점심"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.ygg2().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when1
                                                          }
                                                        }
                                                        render json: msg, status: :ok
                                                        
                                                    elsif content == "양진재 저녁"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.ygg3().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when1
                                                          }
                                                        }
                                                        render json: msg, status: :ok


                              elsif content == "양성재"
                                  msg = {
                                    message: {
                                      "text":"평일아침 07:20~09:00\n평일점심 11:30~13:30\n평일저녁 17:30~19:10\n주말아침 08:00~09:00\n주말점심 12:00~13:00\n주말저녁 17:30~19:00"
                                    },
                                    
                                    keyboard: {
                                      type: "buttons",
                                      buttons: food_when2
                                    }
                                  }
                                  render json: msg, status: :ok                          
            
                                                    elsif content == "양성재 아침"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.ysg1().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when2
                                                          }
                                                        }
                                                        render json: msg, status: :ok            
            
                                                    elsif content == "양성재 점심"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.ysg2().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when2
                                                          }
                                                        }
                                                        render json: msg, status: :ok
                                                        
                                                    elsif content == "양성재 저녁"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.ysg3().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when2
                                                          }
                                                        }
                                                        render json: msg, status: :ok


                              elsif content == "개성재"
                                  msg = {
                                    message: {
                                      "text":"평일아침 07:20~09:00\n평일점심 11:30~13:30\n평일저녁 17:30~19:10\n주말아침 08:00~09:00\n주말점심 12:00~13:00\n주말저녁 17:30~19:00"
                                    },
                                    
                                    keyboard: {
                                      type: "buttons",
                                      buttons: food_when3
                                    }
                                  }
                                  render json: msg, status: :ok                          
            
                                                    elsif content == "개성재 아침"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.gsg1().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when3
                                                          }
                                                        }
                                                        render json: msg, status: :ok            
            
                                                    elsif content == "개성재 점심"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.gsg2().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when3
                                                          }
                                                        }
                                                        render json: msg, status: :ok
                                                        
                                                    elsif content == "개성재 저녁"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.gsg3().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when3
                                                          }
                                                        }
                                                        render json: msg, status: :ok

                              elsif content == "한빛식당(신학1층)"
                                  msg = {
                                    message: {
                                      "text":"메뉴를 골라주세요"
                                    },
                                    
                                    keyboard: {
                                      type: "buttons",
                                      buttons: food_when4
                                    }
                                  }
                                  render json: msg, status: :ok                          
            
                                                    elsif content == "주먹밥[8:30~10:50]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh1().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok            
            
                                                    elsif content == "백반[11:00~14:00]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh2().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok
                                                        
                                                    elsif content == "백반특식[11:00~14:00]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh3().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok

                                                    elsif content == "일품[11:00~14:30]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh4().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok

                                                    elsif content == "양식[11:00~14:30]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh5().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok
                                                        
                                                    elsif content == "분식[11:00~14:30]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh6().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok
                                                        
                                                    elsif content == "저녁[16:30~18:30]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh7().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok                                                        
                                                        
                                                     elsif content == "면코너[10:00~17:30]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh8().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok                                                       

                                                     elsif content == "간식코너[10:00~17:30]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh9().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok

                              elsif content == "별빛레스토랑(신학2층)"
                                  msg = {
                                    message: {
                                      "text":"메뉴를 골라주세요"
                                    },
                                    
                                    keyboard: {
                                      type: "buttons",
                                      buttons: food_when5
                                    }
                                  }
                                  render json: msg, status: :ok 
                                  
                                                     elsif content == "별빛레스토랑 점심[11:30~14:00]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.bb1().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when5
                                                          }
                                                        }
                                                        render json: msg, status: :ok

                              elsif content == "은하수식당(교직원식당)"
                                  msg = {
                                    message: {
                                      "text":"메뉴를 골라주세요"
                                    },
                                    
                                    keyboard: {
                                      type: "buttons",
                                      buttons: food_when6
                                    }
                                  }
                                  render json: msg, status: :ok 
                                  
                                                     elsif content == "은하수식당 점심[11:30~13:30]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.uh1().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when6
                                                          }
                                                        }
                                                        render json: msg, status: :ok

                                                     elsif content == "은하수식당 저녁[17:30~19:00]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.uh2().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when6
                                                          }
                                                        }
                                                        render json: msg, status: :ok
                                                        
        elsif content == "소자정보"
            msg = {
              message: {
                text: "소자를 선택해주세요."
              },
              
              keyboard: {
                type: "buttons",
                buttons:  circuit_menu
              }
            }
            render json: msg, status: :ok            
            
            
            
                                    elsif content == "■처음으로"           #공통적으로 쓰는 ■처음으로
                                        msg = {
                                          message: {
                                            text: "원하는 항목을 선택해주세요."
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: main_menu
                                          }
                                        }
                                        render json: msg, status: :ok             
            
            
                                    elsif content == "2114 / 1024 x 4 SRAM"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99A596505AD378590FC836",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/43?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                   
            
            
                                    elsif content == "2716 / NMOS 128K 16K x 8 UV EPROM"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile22.uf.tistory.com/image/99E9EE455AD378A5091C1F",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/44?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   
                                        
                                    elsif content == "4001 / 4001B / Quad 2 Input NOR Buffered Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile28.uf.tistory.com/image/9959704E5AD378E20996BA",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/45?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                           
                                        
                                    elsif content == "4011 / Quad 2-Input NAND Buffered Series"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile21.uf.tistory.com/image/9970594B5AD37932285D3A",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/46?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                           
                                        
                                    elsif content == "4050 / 4050B / Hex Non-Inverting Buffer"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99D55B445AD3795727766C",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/47?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                           
                                        
                                    elsif content == "4520 / 4520B / Dual 4-Bit Binary Counter"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile26.uf.tistory.com/image/9957384D5AD379990A25DB",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/48?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                           
                                        
                                    elsif content == "7400 / 74LS00 / Quad 2-Input NAND Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/997C684C5AD35E810E9408",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/11?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                           

                                    elsif content == "7402 / 74LS02 / Quad 2-Input Nor Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/9945034A5AD35F6F1A12CB",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/12?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   


                                    elsif content == "7403 / 74LS03 / Quad 2-Input Nand Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile6.uf.tistory.com/image/997FD54A5AD36FEE38883F",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/13?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7404 / 74LS04 / Hex Inverter"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile30.uf.tistory.com/image/9925A74D5AD37036109DB8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/14?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7405 / 74LS05 / Hex Inverter"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/99D9B3495AD3706C32151C",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/15?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   
                                    elsif content == "7406 / 74LS06 / Hex Inverted Buffers with OC Outputs"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile27.uf.tistory.com/image/9959663F5AD370910AD8F4",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/16?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   


                                    elsif content == "7408 / 74LS08 / Quad 2-Input AND Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile24.uf.tistory.com/image/9920B93C5AD370BC1B9B8B",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/17?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7410 / 74LS10 / Triple 3-Input NAND Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile3.uf.tistory.com/image/99D20A335AD3710606EB75",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/18?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7411 / 74LS11 / Triple 3 Input AND Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/997493335AD371320D83D8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/19?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7420 / 74LS20 / Dual 4-Input NAND Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile8.uf.tistory.com/image/9979A93D5AD371630C1294",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/20?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7421 / 74LS21 / Dual 4-Input Positive AND Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile28.uf.tistory.com/image/99A82B3C5AD3719029FE69",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/21?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   
                                    elsif content == "7432 / 74LS32 / Quad 2-Input OR Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile8.uf.tistory.com/image/99038A395AD371BA275CA0",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/22?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   
                                    elsif content == "7442 / 74LS42 / BCD to Decimal Decoder"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile28.uf.tistory.com/image/9982A2355AD371EA0B8868",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/23?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7447 / 74LS47 / BCD to 7-segment Decoders/Drivers"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile4.uf.tistory.com/image/995BB63A5AD37216366455",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/24?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   


                                    elsif content == "7472 / 74LS72 / AND-gated JK FF with Preset and Clear"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99453B375AD37253200912",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/25?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7474 / 74LS02 / D Flip-Flop"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile23.uf.tistory.com/image/993AE3405AD372A10C3B63",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/26?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7476 / 74LS76 / Dual Master Slave J-K F-F"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile27.uf.tistory.com/image/99E0A7335AD372CF1D5418",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/27?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 


                                    elsif content == "7486 / 74LS86 / Quad 2-Input Exclusive-OR Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile22.uf.tistory.com/image/992F52395AD372F302F1FF",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/28?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 


                                    elsif content == "7489 / 74LS89 / 64 Bit RAM"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile7.uf.tistory.com/image/9929C43E5AD3731B34E87E",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/29?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "7490 / 74LS90 / Decade and Binary Counters"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile1.uf.tistory.com/image/997284335AD37344035160",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/30?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "7493 / 74LS93 / Decade and Binary Counters"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/99BBF33B5AD3736A128D87",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/31?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "74121 / 74LS121 / One-Shot with Clear and Complementary Outputs"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/9957673A5AD37392209F78",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/32?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "74138 / 74LS138 / Decoder / Demultiplexer"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99425E3B5AD373B733B963",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/33?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "74151 / 74LS151 / Data Selectors / Multiplexers"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile4.uf.tistory.com/image/99DFA6335AD373E639E897",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/34?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "74153 / 74LS153 / Data 4-Line to 1-Line Data Selectors / Mux"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile9.uf.tistory.com/image/99D0C23D5AD374130EE840",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/35?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 
                                        
                                        
                                    elsif content == "74164 / 74LS164 / 8 BIT SIPO SHIFT REGISTER"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile26.uf.tistory.com/image/990720405AD3743C291313",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/36?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                         
                                        
                                    elsif content == "74169 / 74LS169 / 4-Bit Up / Down Binary Counter"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile21.uf.tistory.com/image/99C6B93A5AD3746E0BE1E8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/37?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                         
                                        
                                    elsif content == "74390 / 74LS390 / Dual 4-Bit Decade Counter"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile10.uf.tistory.com/image/9943F3385AD374A028336F",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/38?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok  
                                        
                                    elsif content == "1N4001 / Diode"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile27.uf.tistory.com/image/99B25E4E5AD5F7271E02D7",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/69?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                        
                                        
                                    elsif content == "1N4002 / Diode"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile27.uf.tistory.com/image/99D3B6435AD5F74618B489",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/70?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                        
                                        
                                    elsif content == "2N2222 / Transister"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/99122E445AD5F79D05E141",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/72?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok
                                        
                                    elsif content == "CA3046 / Transister"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile6.uf.tistory.com/image/99179E445AD5F7BA37DD0B",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/73?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                        
                                        
                                    elsif content == "CD4007 / Transister"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile28.uf.tistory.com/image/99E9A44C5AD5F7D525F3B2",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/74?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok
                                        
                                    elsif content == "MC14007UB / Dual Complementary Pair Plus Inverter"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile1.uf.tistory.com/image/9944734B5AD5F7F228D4DA",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/75?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok
                                      
                                        

                                    elsif content == "FND507 / 7segment"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile27.uf.tistory.com/image/99FC68385AD374D009FFBE",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/39?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok  
                                        
                                    elsif content == "LM555 / timer"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/99C4A3335AD375102884E9",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/40?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok  
                                        
                                    elsif content == "LM741 / Single Operational Amplifer"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/99673B3A5AD3754D07A3D6",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/41?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                          
                                        
                                    elsif content == "8p Dip Switch"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile23.uf.tistory.com/image/9977F8405AD3757D262AD9",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/42?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                          
                                        
                                    elsif content == "라즈베리파이"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile23.uf.tistory.com/image/99C3F5505AD4F97B222553",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/66?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                          
                                        
                                     elsif content == "아두이노"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile21.uf.tistory.com/image/9945E34C5AD4FB0F22C434",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/67?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                         
                                        
                                    elsif content == "검색(AllDataSheet)"
                                        msg = {
                                          message: {
                                            message_button: {
                                              "label": "AllDataSheet 이동",
                                              "url": "http://www.alldatasheet.co.kr"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok  




        elsif content == "사용법"
            msg = {
              message: {
                text: "원하는 사용법을 선택해주세요."
              },
              
              keyboard: {
                type: "buttons",
                buttons: use_menu
              }
            }
            render json: msg, status: :ok              
            
            
                                    elsif content == "저항 읽는법"
                                        msg = {
                                          message: {
                                            "text":"1Ω 갈흑금금 3.3Ω 주주금금\n10Ω 갈흑흑금 330Ω 주주갈금\n470Ω 황보갈금 560Ω 녹청갈금
                                            \n1KΩ 갈흑적금 1.8KΩ 갈회적금\n2KΩ 적흑적금 2.2KΩ 적적적금\n3.3KΩ 주주적금 4.7KΩ 황보적금
                                            \n5.6KΩ 녹청적금 6.8KΩ 청회적금\n10KΩ 갈흑주금 15KΩ 갈녹주금\n20KΩ 적흑주금 33KΩ 주주주금
                                            \n47KΩ 황보주금 51KΩ 녹갈주금\n140KΩ 갈황황금 390KΩ 주백황금",
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/995D30425AD4EB8911F13A",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/60?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok          
            

                                    elsif content == "커패시터 읽는법"
                                        msg = {
                                          message: {
                                            text:"0.01[uF] = 103\n0.047[uF] = 473\n0.47[uF] = 474\n3.5[uF] = 355\n4.7[uF] = 475",
                                            "photo": {
                                              "url": "http://cfile26.uf.tistory.com/image/995A59395AD4F06D187797",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/62?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  

                                    elsif content == "인덕터 읽는법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile1.uf.tistory.com/image/9970A33B5AD4EE5E16CAE8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/61?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  


                                    elsif content == "브래드보드 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile30.uf.tistory.com/image/99F6744F5AD4F28C168D8A",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/63?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  

                                    elsif content == "가변저항 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile26.uf.tistory.com/image/996EA8475AD4F4741F956A",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/64?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  

                                    elsif content == "함수발생기 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99142B345ADD2DAE058743",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/119?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  
                                        
                                    elsif content == "오실로스코프 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fphyslab.snu.ac.kr%2Fnewphyslab%2Flab%2Fimage%2Foscillo%2Foscil01.jpg%22&type=w620",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/113?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  

                                    elsif content == "아날로그 멀티미터(테스터기) 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://img1.daumcdn.net/thumb/R1920x0/?fname=http%3A%2F%2Fcfile30.uf.tistory.com%2Fimage%2F244B844A5910EB97156FC2",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/114?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  


                                    elsif content == "디지털 멀티미터 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/9923834B5ADD2F263187FD",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/115?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok              

                                    elsif content == "전원공급기 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "https://postfiles.pstatic.net/MjAxNzA5MTJfMjQg/MDAxNTA1MTQyMTEzMjc5.sFUrcTZTnwATM1HYpLCu-tQxorV3m58SnEGHh_JC_2Ag.QN1Uc_xc6dQ6Ebm4xLo45Q7TIikWZhvhiQjZ0C9SrNEg.JPEG.cj3024/DC_Power_supply_cv%EC%83%81%ED%83%9C.jpg?type=w773",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/116?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  

                                    elsif content == "납땜하는 방법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://kocoafab.cc//data/201508241452302866.jpg",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/117?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok
                                        
                                    elsif content == "피스파이스 사용법"
                                        msg = {
                                          message: {
                                            text: "피스파이스(Capture CIS) 실행 -> File-New Project -> Name 임의로설정 ->\
                                            Analog or Mixed A/D 선택 -> OK -> Create a blank project -> OK ->\
                                            화면나온상태에서 P누르면 -> Add Library -> PSpice폴더내의 라이브러리 모두선택후 열기
                                            \n
                                            *MOSFET(CA3046)\nPart에 검색 Q2N2222(아무BJT) -> OK -> 우클릭 - Edit PSpice Model ->\
                                            주어진 모델변수로 변경(ca3046)\n모델변수는 '자세히보기' 클릭",

                                            
                                            "photo": {
                                              "url": "http://cfile23.uf.tistory.com/image/991112445AD6051D2292B9",
                                              "width": 420,
                                              "height": 330
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/77?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                        
                                    elsif content == "MATLAB 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/990FEC505ADD2FB6101723",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/118?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok


                                        
        elsif content == "전자상식(공사중)"
            msg = {
              message: {
                text: "원하는 과목을 선택해주세요."
              },
              
              keyboard: {
                type: "buttons",
                buttons: formula_menu
              }
            }
            render json: msg, status: :ok    

                                    elsif content == "단위"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/9964AE4F5AD71B7A28E9B8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/80?category=999164"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: formula_menu
                                          }
                                        }
                                        render json: msg, status: :ok 
                                        
                                    elsif content == "각종상수들"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99A2A8505AEB0DB9248239",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/120?category=999164"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: formula_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                       

                                    elsif content == "주기율표"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile8.uf.tistory.com/image/99A1574D5AEB0CFB0D9D1C",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/132?category=999164"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: formula_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "반도체8대공정"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile4.uf.tistory.com/image/99379E465AE08153187068",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/122?category=998826"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: formula_menu
                                          }
                                        }
                                        render json: msg, status: :ok 
                                        
                                    elsif content == ""
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/9964AE4F5AD71B7A28E9B8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히���기",
                                              "url": "http://dogbok.tistory.com/80?category=999164"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: formula_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                         
                                        
                                    elsif content == ""
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/9964AE4F5AD71B7A28E9B8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히���기",
                                              "url": "http://dogbok.tistory.com/80?category=999164"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: formula_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                         
                                        

        elsif content == "충북대위키(랜덤)"
            msg = {
              message: {
                text: random_reply
              },
              
              keyboard: {
                type: "buttons",
                buttons: main_menu
              }
            }
            render json: msg, status: :ok  



            
            
        elsif content == "충북대학교 어둠의게시판"
            msg = {
              message: {
                "photo": {
                       "url": "http://cfile25.uf.tistory.com/image/992DAB425AD521511EE54E" ,
                      "width": 720,
                      "height": 630
                   },
                    "message_button": {
                      "label": "가즈아",     
                      "url": "http://boksberry.iwinv.net/wp/"
                    }
              },
              
              keyboard: {
                type: "buttons",
                buttons: main_menu
              }
            }
            render json: msg, status: :ok            
            
            
            
        else
            msg = {
              message: {
                  text: "잘못된 입력입니다.다시선택해주세요."
              },

              
              keyboard: {
                type: "buttons",
                buttons: main_menu
              }
            }
            render json: msg, status: :ok
            
        end
    end
    


    def friend
        if request.method == 'POST'
            render status: 200
        elsif request.method == 'DELETE'
            render status: 200
        end
    end


    # 채팅방 나갔을 때 구현
    def chat_room
        if request.method == 'DELETE'
            render status: 200
        end
    end
    
end
