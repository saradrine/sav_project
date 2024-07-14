import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConfirmationSuccess extends StatelessWidget {
  const ConfirmationSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 30),
          color: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Confirmation Réussie',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 35),
                // Image(
                //   image: AssetImage('assets/icons/check-mark.png'),
                //   width: 100,
                //   height: 100,
                // ),
                SvgPicture.string(
                  '''<svg width="108" height="108" viewBox="0 0 108 108" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M69.7585 31.0339L57.5545 48.3679C57.0955 49.0226 56.3665 49.3736 55.624 49.3736C55.1515 49.3736 54.679 49.2319 54.2673 48.9416C53.2008 48.1924 52.9443 46.7141 53.6935 45.6476L54.382 44.6689C53.9568 44.2909 53.5315 43.9129 53.0995 43.5484C52.384 42.9206 51.6618 42.3199 50.9463 41.7394L51.1893 41.4356C51.9318 40.1464 52.5258 38.7626 52.978 37.3181C53.2885 37.5611 53.6058 37.8176 53.923 38.0741C54.5575 38.5871 55.1988 39.1204 55.8333 39.6671C56.2653 40.0316 56.6905 40.4029 57.1158 40.7809L65.8908 28.3136C66.6468 27.2471 68.1183 26.9906 69.1848 27.7399C70.2513 28.4959 70.5078 29.9674 69.7585 31.0339Z" fill="#282A35" fill-opacity="0.7"></path><path d="M90.7241 67.4231C90.3191 67.6931 89.8668 67.8213 89.4146 67.8213C88.6518 67.8213 87.9026 67.4501 87.4503 66.7683C85.3241 63.5823 82.2461 61.7733 78.3041 61.3818C76.9068 61.2401 75.5568 61.3008 74.3351 61.4628C72.6611 61.6923 71.2166 62.1311 70.1703 62.5563C69.2928 62.9208 68.6921 63.2718 68.4693 63.4946C67.5513 64.4126 66.0528 64.4126 65.1348 63.4946C64.2101 62.5698 64.2101 61.0713 65.1348 60.1533C65.6681 59.6201 66.4443 59.0936 67.3961 58.6143C66.8966 57.9596 66.3701 57.2913 65.8233 56.6163H65.8166C63.7983 54.1256 61.5371 51.6146 59.0801 49.1373L60.6528 46.9031L61.8408 45.2156L62.0906 45.4653C64.7906 48.1653 67.2746 50.9126 69.4886 53.6328C70.4336 54.8006 71.3111 55.9413 72.1143 57.0483C74.1866 56.6231 76.4883 56.4476 78.7698 56.6771C84.1158 57.2103 88.4763 59.7888 91.3788 64.1493C92.1011 65.2361 91.8108 66.7008 90.7241 67.4231Z" fill="#282A35" fill-opacity="0.7"></path><path d="M90.2933 25.2929L70.1452 42.7025C69.1577 43.5557 69.049 45.0481 69.9022 46.0349C70.3693 46.5763 71.0281 46.853 71.691 46.853C72.2384 46.853 72.7878 46.664 73.234 46.2779L93.3821 28.8683C94.3696 28.0151 94.4783 26.5234 93.6251 25.5359C92.7719 24.549 91.2795 24.4397 90.2933 25.2929Z" fill="#282A35" fill-opacity="0.7"></path><path d="M104.458 43.4835C104.26 42.8726 103.731 42.4278 103.095 42.3353L97.8451 41.5719L95.4967 36.8145C95.2119 36.238 94.6253 35.8735 93.9834 35.8735C93.3408 35.8735 92.7549 36.2387 92.47 36.8145L90.1224 41.5719L84.8722 42.3353C84.237 42.4278 83.7078 42.8726 83.5094 43.4835C83.3109 44.0944 83.4763 44.7646 83.9367 45.2135L87.7356 48.9166L86.8392 54.1458C86.7305 54.7789 86.9911 55.4188 87.5101 55.7962C88.0292 56.1735 88.7197 56.2241 89.2874 55.9244L93.9834 53.4553L98.68 55.9244C98.9264 56.054 99.1964 56.1181 99.4651 56.1181C99.8147 56.1181 100.163 56.0095 100.457 55.7955C100.977 55.4175 101.237 54.7783 101.128 54.1451L100.232 48.9159L104.031 45.2128C104.491 44.7646 104.656 44.0944 104.458 43.4835ZM97.2403 47.119C96.8427 47.5065 96.6611 48.0647 96.7549 48.6128L97.2234 51.3466L94.7677 50.056C94.522 49.927 94.252 49.8622 93.9827 49.8622C93.7134 49.8622 93.4434 49.927 93.1977 50.056L90.7427 51.3466L91.2112 48.6128C91.3057 48.0647 91.1234 47.5065 90.7258 47.119L88.74 45.1831L91.4845 44.7842C92.034 44.7046 92.5099 44.359 92.7556 43.8615L93.982 41.3741L95.2092 43.8615C95.4549 44.3596 95.9301 44.7046 96.4802 44.7842L99.2248 45.1831L97.2403 47.119Z" fill="#282A35" fill-opacity="0.7"></path><path d="M19.1457 16.9412L18.2487 22.1711C18.14 22.8043 18.4005 23.4442 18.9203 23.8215C19.4394 24.1988 20.1279 24.2488 20.6976 23.9497L25.3935 21.4806L30.0895 23.9497C30.3366 24.0793 30.6059 24.1435 30.8745 24.1435C31.2249 24.1435 31.5732 24.0348 31.8668 23.8208C32.3865 23.4435 32.6471 22.8036 32.5384 22.1704L31.6413 16.9412L35.4409 13.2382C35.9006 12.79 36.0666 12.119 35.8675 11.5081C35.6691 10.8973 35.1412 10.4518 34.5054 10.3593L29.2552 9.59654L26.9069 4.83914C26.6227 4.26269 26.0361 3.89819 25.3935 3.89819C24.7509 3.89819 24.1644 4.26269 23.8802 4.83914L21.5319 9.59654L16.2817 10.3593C15.6459 10.4518 15.118 10.8966 14.9196 11.5081C14.7211 12.119 14.8865 12.7893 15.3462 13.2382L19.1457 16.9412ZM22.8954 12.8095C23.4448 12.7292 23.9207 12.3843 24.1657 11.8861L25.3929 9.39877L26.62 11.8861C26.8657 12.3843 27.3409 12.7292 27.8904 12.8095L30.6349 13.2085L28.6491 15.1444C28.2515 15.5318 28.0699 16.0907 28.1637 16.6381L28.6322 19.3712L26.1779 18.0806C25.6858 17.8221 25.0986 17.8221 24.6072 18.0806L22.1522 19.3712L22.6206 16.6375C22.7145 16.09 22.5336 15.5318 22.1353 15.1444L20.1495 13.2085L22.8954 12.8095Z" fill="#282A35" fill-opacity="0.7"></path><path d="M75.9279 63.0152C73.9501 63.1165 72.2289 63.5822 71.0814 64.021C72.4314 66.3295 72.9916 67.8212 73.2211 68.6852C73.3453 69.1564 73.3865 69.4729 73.3953 69.6829L73.3521 69.7018C73.1415 69.6923 72.8269 69.6559 72.3774 69.5357C71.4526 69.286 69.8259 68.6717 67.2811 67.1327C65.1346 65.83 62.7856 64.1492 60.3016 62.131C57.7029 60.025 55.0771 57.649 52.4986 55.0637C49.9134 52.4785 47.5374 49.8527 45.4314 47.2607C43.4131 44.7767 41.7256 42.4277 40.4296 40.2812C38.8906 37.7365 38.2764 36.1097 38.0266 35.185C37.9058 34.7334 37.87 34.4182 37.8606 34.2076L37.8781 34.1671C38.082 34.1758 38.4046 34.2163 38.8704 34.3412C39.7951 34.5842 41.4286 35.1985 43.9734 36.7442C44.1084 36.8252 44.2501 36.913 44.3919 37.0075C44.857 37.2903 45.3288 37.5934 45.8067 37.9241C45.4813 38.5336 45.1175 39.1182 44.7071 39.6643C43.9228 40.7071 44.1327 42.1881 45.1756 42.9724C45.6008 43.2924 46.0996 43.4463 46.5937 43.4463C47.3113 43.4463 48.0193 43.1209 48.4837 42.504C49.3903 41.2984 50.1402 39.9707 50.7322 38.5579C50.7585 38.4945 50.7808 38.4297 50.8071 38.3662C50.9286 38.0679 51.0454 37.7675 51.152 37.4624C51.1972 37.3342 51.2357 37.2032 51.2782 37.0743C51.3572 36.8333 51.4355 36.5923 51.5057 36.348C51.5185 36.3041 51.5341 36.2623 51.5462 36.2184C51.5442 36.217 51.5428 36.2157 51.5408 36.2143C52.5425 32.6321 52.61 28.6665 51.6448 24.7994C50.288 19.363 47.1263 15.018 43.1863 13.1773C42.0051 12.6244 40.5977 13.1354 40.0462 14.3173C39.4941 15.4993 40.0044 16.9053 41.1863 17.4574C43.8094 18.6832 46.0605 21.934 47.0602 25.9422C47.6791 28.4228 47.7709 30.9412 47.3713 33.2902C47.37 33.2896 47.3686 33.2882 47.3673 33.2875C47.0433 33.085 46.726 32.8893 46.4155 32.7003C43.9923 31.2288 41.8593 30.2433 40.084 29.7708C37.6 29.116 35.6898 29.4333 34.4073 30.7158C33.787 31.3361 33.3982 32.1029 33.2281 33.0054L3.65632 100.794C3.26752 101.685 3.46395 102.722 4.1511 103.409C4.60335 103.862 5.20815 104.101 5.8224 104.101C6.141 104.101 6.4623 104.036 6.76605 103.904L74.5286 74.3424C75.4446 74.175 76.2202 73.7781 76.8452 73.153C78.1277 71.8705 78.445 69.9603 77.7902 67.4763C77.4466 66.1742 76.8189 64.6825 75.9279 63.0152ZM36.3864 42.7315C37.7971 45.0602 39.6061 47.5847 41.7594 50.2375C43.9734 52.9577 46.4574 55.705 49.1574 58.405C51.8506 61.105 54.6046 63.589 57.3249 65.803C59.9776 67.9562 62.5021 69.7652 64.8309 71.1692C65.6139 71.6444 66.3625 72.0636 67.0827 72.4369L60.1376 75.4669C48.641 75.8287 37.4738 72.1844 31.2233 65.9292C28.9108 63.6146 27.5081 61.1259 27.149 58.76L35.1241 40.479C35.4961 41.1979 35.9132 41.9471 36.3864 42.7315ZM32.7859 87.3982C26.7285 87.2248 22.0852 85.7499 19.5877 83.1754C18.6892 82.2493 18.1067 81.2004 17.8455 80.0853L25.1517 63.3379C26.0177 65.051 27.255 66.7311 28.8365 68.3133C33.4191 72.8992 41.7891 77.4582 52.9529 78.6003L32.7859 87.3982ZM16.0601 84.1792C16.3875 84.6449 16.7493 85.0978 17.1658 85.5271C18.8134 87.2254 21.6795 89.1256 26.5624 90.1144L10.3942 97.1682L16.0601 84.1792Z" fill="#282A35" fill-opacity="0.7"></path><path d="M85.3863 19.8584C89.1123 19.8584 92.1438 16.8269 92.1438 13.1009C92.1438 9.37493 89.1123 6.34351 85.3863 6.34351C81.6603 6.34351 78.6289 9.37493 78.6289 13.1009C78.6289 16.8269 81.6603 19.8584 85.3863 19.8584ZM85.3863 9.71851C87.2514 9.71851 88.7688 11.2359 88.7688 13.1009C88.7688 14.966 87.2514 16.4834 85.3863 16.4834C83.5213 16.4834 82.0039 14.966 82.0039 13.1009C82.0039 11.2359 83.5213 9.71851 85.3863 9.71851Z" fill="#282A35" fill-opacity="0.7"></path><path d="M61.6819 23.4427C64.9989 23.4427 67.6968 20.7447 67.6968 17.4278C67.6968 14.1108 64.9989 11.4128 61.6819 11.4128C58.365 11.4128 55.667 14.1108 55.667 17.4278C55.667 20.7447 58.3656 23.4427 61.6819 23.4427ZM61.6819 14.7885C63.1372 14.7885 64.3218 15.9725 64.3218 17.4284C64.3218 18.8844 63.1379 20.0684 61.6819 20.0684C60.2259 20.0684 59.042 18.8844 59.042 17.4284C59.042 15.9725 60.2266 14.7885 61.6819 14.7885Z" fill="#039388"></path><path d="M90.4563 75.5002C87.1394 75.5002 84.4414 78.1982 84.4414 81.5145C84.4414 84.8314 87.1394 87.5294 90.4563 87.5294C93.7726 87.5294 96.4706 84.8314 96.4706 81.5145C96.4706 78.1982 93.7726 75.5002 90.4563 75.5002ZM90.4563 84.1544C89.001 84.1544 87.8164 82.9698 87.8164 81.5145C87.8164 80.0592 89.001 78.8752 90.4563 78.8752C91.9116 78.8752 93.0956 80.0592 93.0956 81.5145C93.0956 82.9698 91.9116 84.1544 90.4563 84.1544Z" fill="#039388"></path></svg>''',
                ),
                SizedBox(height: 35),
                Text(
                  'Votre compte a été activé avec succès.',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Se connecter'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 106, 202, 179),
                    foregroundColor: Colors.black,
                    textStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
