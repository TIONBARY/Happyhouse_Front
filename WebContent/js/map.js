$(document).ready(function() {
      var aptname;
      
      $("#dosi").click(function(){
        const e = document.getElementById("dosi");
        const selectValue = e.options[e.selectedIndex].value;

        $.get(
          "https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000",
          function (data) {
            $.each(data.regcodes, function (index, item) {
              if (item.name == selectValue) {
                let code = (item.code + "").slice(0, 2);
                $.get(
                  "https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=" +
                    code +
                    "*000000",
                  function (data2) {
                    console.log(data2);
                    localStorage.setItem("siguArr", JSON.stringify(data2));
                    let sigu = "";
                    $.each(data2.regcodes, function (index2, item2) {
                      if (index2 != 0) {
                        sigu += "<option>" + item2.name + "</option>";
                      }
                    });
                    $("#sigu").html(sigu);
                  }
                );
              }
            });
          }
        );
      });

      $("#sigu").click(function () {
        const e = document.getElementById("sigu");
        const selectValue = e.options[e.selectedIndex].value;

        let siguArr = localStorage.getItem("siguArr");
        siguArr = JSON.parse(siguArr);

        $.each(siguArr.regcodes, function (index, item) {
          if (item.name == selectValue) {
            let code = (item.code + "").slice(0, 4);
            //console.log(code);
            $.get(
              `https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=${code}*`,
              function (data) {
                //console.log(data);
                let dong = "";
                $.each(data.regcodes, function (index, item) {
                  if (index != 0) {
                    dong += "<option>" + item.name + "</option>";
                  }
                });
                $("#dong").html(dong);
              }
            );
          }
        });
      });

      $("#searchBtn").click(function(){
        const e = document.getElementById("dong");
        const selectValue = e.options[e.selectedIndex].value;

        var ServiceKey =
          "yxvdsQAG/HqTUqohKBZWdyImqb+s96N3Swbnur98SgrKd6weQnflf08Y4EwwMybrv6mQsZl+HgqOpzmW88hicA==";
        var pageNo = "1";
        var numOfRows = "30";
        var LAWD_CD = "11110";
        var DEAL_YMD = "202012";
        // server에서 넘어온 data
        $.ajax({
          url: "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev",
          type: "GET",
          data: {
            ServiceKey: ServiceKey,
            pageNo: pageNo,
            numOfRows: numOfRows,
            LAWD_CD: LAWD_CD,
            DEAL_YMD: DEAL_YMD,
          },
          dataType: "xml",
          success: function (response) {
            console.log(response);
            makeList(response);
          },
          error: function (xhr, status, msg) {
            console.log("상태값 : " + status + " Http에러메시지 : " + msg);
          },
        });

        function makeList(data) {
          var aptlist = ``;

          var mapContainer = document.getElementById("maps"), // 지도를 표시할 div
            mapOption = {
              center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
              level: 3, // 지도의 확대 레벨
            };

          // 지도를 생성합니다
          var map = new kakao.maps.Map(mapContainer, mapOption);

          // 주소-좌표 변환 객체를 생성합니다
          var geocoder = new kakao.maps.services.Geocoder();

          // 주소로 좌표를 검색합니다
          geocoder.addressSearch(`서울특별시`, function (result, status) {
            // 정상적으로 검색이 완료됐으면
            if (status === kakao.maps.services.Status.OK) {
              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new kakao.maps.Marker({
                map: map,
                position: coords,
              });

              // 인포윈도우로 장소에 대한 설명을 표시합니다
              var infowindow = new kakao.maps.InfoWindow({
                content:
                  '<div style="width:150px;text-align:center;padding:6px 0;">서울특별시</div>',
              });
              infowindow.open(map, marker);

              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords);
            }
          });

          $(data)
            .find("item")
            .each(function () {
              console.log(this);
              aptlist += `
                 <p><li><button class="apt_name_href" value=${$(this)
                   .find("아파트")
                   .text()} id="apt_name" >${$(this).find("아파트").text()}</button></li></p>
                    <p>거래금액 : ${$(this).find("거래금액").text()}만원<br>
                    ${$(this).find("법정동").text()}</p>
              `;

              //alert(studentlist);
              $("#aptlist").empty().append(aptlist);
              $("p").css("font-weight", "bold");
            });
          $("li").css("color", "black").css("font-weight", "bold").css("font-size", "20px");
          $(".apt_name_href")
            .css("border-style", "none")
            .css("color", "white")
            .css("background-color", "gray")
            .css("width", "200")
            .css("height", "60")
            .css("font-weight", "bold");
        }

        // function makeList(data) {
        //   var aptlist = ``;
        //   $(data)
        //     .find("item")
        //     .each(function () {
        //       console.log($(this).find("아파트").text() + "---");
        //       aptlist += `
        //          <p><li><button value="${$(this).find("아파트").text()}" class="aptlistBtn" id="${$(this).find("아파트").text()}">${$(this).find("아파트").text()}</button></li></p>
        //             <p>거래금액 : ${$(this).find("거래금액").text()}만원<br>
        //             ${$(this).find("법정동").text()}</p>
        //       `;
        //       //alert(studentlist);
        //       $("#aptlist").empty().append(aptlist);
        //       $("p").css("font-weight", "bold");
        //     });
        //   $("li").css("color", "black").css("font-weight", "bold").css("font-size", "20px");
        // }
        $(document).on("click", ".apt_name_href", function () {
          aptname = this.value;
          const aptN = {
            aptname: aptname,
          };

          $.ajax({
            url: "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev",
            type: "GET",
            data: {
              ServiceKey: ServiceKey,
              pageNo: pageNo,
              numOfRows: numOfRows,
              LAWD_CD: LAWD_CD,
              DEAL_YMD: DEAL_YMD,
            },
            dataType: "xml",
            success: function (response) {
              var aptlist = ``;
              $(response)
                .find("item")
                .each(function () {
                  // console.log($(this).find("아파트").text());
                  if (aptname == $(this).find("아파트").text()) {
                    aptlist += `
                <p><li><h3>${$(this).find("아파트").text()}</h3></li></p>
                  <p>거래금액 : ${$(this).find("거래금액").text()}만원<br>
                    주소 : ${$(this).find("법정동").text()} ${$(this).find("지번").text()}<br>
                    건축년도 : ${$(this).find("건축년도").text()}년</p>
                    `;

                    var mapContainer = document.getElementById("maps"), // 지도를 표시할 div
                      mapOption = {
                        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                        level: 3, // 지도의 확대 레벨
                      };

                    // 지도를 생성합니다
                    var map = new kakao.maps.Map(mapContainer, mapOption);

                    // 주소-좌표 변환 객체를 생성합니다
                    var geocoder = new kakao.maps.services.Geocoder();

                    // 주소로 좌표를 검색합니다
                    geocoder.addressSearch(
                      `${$(this).find("법정동").text()} ${$(this).find("지번").text()}`,
                      function (result, status) {
                        // 정상적으로 검색이 완료됐으면
                        if (status === kakao.maps.services.Status.OK) {
                          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                          // 결과값으로 받은 위치를 마커로 표시합니다
                          var marker = new kakao.maps.Marker({
                            map: map,
                            position: coords,
                          });

                          // 인포윈도우로 장소에 대한 설명을 표시합니다
                          var infowindow = new kakao.maps.InfoWindow({
                            content: `<div style="width:150px;text-align:center;padding:6px 0;">${this.aptname}</div>`,
                          });
                          infowindow.open(map, marker);

                          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                          map.setCenter(coords);
                        }
                      }
                    );

                    //alert(studentlist);
                    $("#aptlist").empty().append(aptlist);
                    $("p").css("font-weight", "bold");
                  }
                });
            },
            error: function (xhr, status, msg) {
              console.log("상태값 : " + status + " Http에러메시지 : " + msg);
            },
          });
        });
      });
})