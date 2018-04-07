module View.Fire
    exposing
        ( viewFire
        )

import Css exposing (Style, px)
import CssShorthand exposing (animationCycle)
import Msg exposing (Msg)
import Svg.Styled exposing (Svg, circle, g, path, styled)
import Svg.Styled.Attributes exposing (cx, cy, d, r)
import SvgShorthand exposing (fill, strokeWidth)
import View.Colors exposing (paleGreen)


fireAnimation : String -> Style
fireAnimation =
    animationCycle 4000


fireShimmerAnimation : String -> Style
fireShimmerAnimation =
    animationCycle 800


viewFire : Svg Msg
viewFire =
    let
        style =
            [ fill paleGreen
            , strokeWidth <| px 0
            ]
    in
    styled g
        style
        []
        [ viewSpinner
        , viewTeacher
        , viewStudent
        ]


viewSpinner : Svg Msg
viewSpinner =
    let
        style =
            [ fireAnimation "fireSpinnerCycle"
            ]
    in
    styled g
        style
        []
        [ circle [ cx "53.814999", cy "47.021843", r "2" ] []
        , viewSpinnerFins
        ]


viewSpinnerFins : Svg Msg
viewSpinnerFins =
    let
        style =
            [ fireAnimation "fireSpinnerFinsCycle"
            ]

        pathData =
            "M 55.265625 38.111328 L 54.490234 42.931641 L 56.921875 41.041016 L 55.265625 38.111328 z M 52.707031 39.777344 A 0.95717001 0.95717001 0 0 0 51.769531 40.544922 A 0.95717001 0.95717001 0 0 0 52.519531 41.671875 A 0.95717001 0.95717001 0 0 0 53.646484 40.921875 A 0.95717001 0.95717001 0 0 0 52.896484 39.794922 A 0.95717001 0.95717001 0 0 0 52.707031 39.777344 z M 50.447266 40.878906 A 0.57829818 0.57829818 0 0 0 49.880859 41.34375 A 0.57829818 0.57829818 0 0 0 50.333984 42.023438 A 0.57829818 0.57829818 0 0 0 51.013672 41.572266 A 0.57829818 0.57829818 0 0 0 50.560547 40.890625 A 0.57829818 0.57829818 0 0 0 50.447266 40.878906 z M 52.974609 50.822266 L 50.228516 52.716797 L 52.107422 55.541016 L 52.974609 50.822266 z M 57.138672 51.800781 A 0.57829818 0.57829818 0 0 0 56.572266 52.265625 A 0.57829818 0.57829818 0 0 0 57.025391 52.947266 A 0.57829818 0.57829818 0 0 0 57.707031 52.494141 A 0.57829818 0.57829818 0 0 0 57.253906 51.8125 A 0.57829818 0.57829818 0 0 0 57.138672 51.800781 z M 54.832031 52.318359 A 0.95717001 0.95717001 0 0 0 53.894531 53.085938 A 0.95717001 0.95717001 0 0 0 54.644531 54.214844 A 0.95717001 0.95717001 0 0 0 55.771484 53.462891 A 0.95717001 0.95717001 0 0 0 55.021484 52.335938 A 0.95717001 0.95717001 0 0 0 54.832031 52.318359 z"
    in
    styled path
        style
        [ d pathData ]
        []


viewTeacher : Svg Msg
viewTeacher =
    let
        style =
            [ fireAnimation "fireTeacherCycle"
            ]

        shimmerStyle =
            [ fireShimmerAnimation "fireTeacherShimmerCycle"
            ]

        pathData =
            "M 27.771484 16.166016 C 26.043657 19.032629 27.299227 19.860851 26.658203 21.742188 C 26.017179 23.623522 24.665072 23.793748 24.908203 26.216797 C 25.394465 31.062895 27.040468 32.825843 25.945312 33.498047 C 24.040601 34.667158 23.357971 29.831397 21.175781 30.052734 C 22.429374 36.827253 21.712462 38.005402 21.09375 40.806641 C 20.475043 43.607881 19.349016 44.790176 19.34375 46.964844 C 19.343068 53.487444 24.631698 58.774117 31.154297 58.773438 C 37.676222 58.773165 42.96162 53.486769 42.960938 46.964844 C 42.956136 44.587805 41.338478 43.376716 40.890625 40.306641 C 40.442771 37.236566 42.440928 32.656832 40.994141 30.427734 C 40.994141 30.427734 39.00663 35.737216 36.992188 34.050781 C 36.314174 32.527076 37.175474 29.732996 38.322266 28.566406 C 37.628426 28.087289 36.740336 28.853336 35.882812 29.617188 C 35.025289 30.381038 34.19775 31.143369 33.628906 30.654297 C 32.561575 29.736644 33.960899 28.150822 34.238281 25.949219 C 34.128999 23.810185 32.188588 22.546195 31.992188 20.306641 C 30.681369 22.027091 32.447266 23.277185 32.126953 24.601562 C 31.729933 26.243102 30.45537 26.796454 29.447266 26.546875 C 28.43916 26.297294 28.640558 24.453069 28.800781 21.919922 C 28.936845 19.768728 27.689496 18.543674 27.771484 16.166016 z M 34.972656 39.285156 C 34.565168 39.919023 34.583399 42.589948 34.867188 42.908203 C 35.150977 43.226459 38.296054 45.545537 37.601562 47.978516 C 36.833189 50.670327 35.666008 51.037492 34.216797 51.492188 C 32.767586 51.946882 30.376386 50.549076 30.658203 48.015625 C 33.000068 50.908439 34.911682 48.152619 34.882812 47.115234 C 34.845923 45.789384 31.670892 44.782219 30.167969 45.595703 C 28.765354 46.354894 27.724469 49.177437 28.152344 50.361328 C 28.580219 51.545219 29.788432 52.682979 31.332031 53.044922 C 32.875632 53.406866 35.2337 53.330038 36.980469 51.636719 C 36.438421 53.93149 33.837944 55.698473 31.09375 55.658203 C 28.349556 55.617942 24.640361 53.28907 24.027344 50.443359 C 23.574333 48.340418 24.605392 45.787038 25.755859 44.412109 C 26.512944 43.507312 26.789445 41.484044 26.234375 40.394531 C 27.507208 40.58718 28.134124 42.802215 28.726562 42.646484 C 29.319003 42.490755 30.636719 39.320312 30.636719 39.320312 C 30.636719 41.019469 31.44087 42.24978 32.007812 42.1875 C 32.574752 42.125225 34.340979 39.355726 34.972656 39.285156 z"
    in
    styled g
        style
        []
        [ styled path
            shimmerStyle
            [ d pathData ]
            []
        ]


viewStudent : Svg Msg
viewStudent =
    let
        style =
            [ fireAnimation "fireStudentCycle"
            ]

        shimmerStyle =
            [ fireShimmerAnimation "fireStudentShimmerCycle"
            ]

        pathData =
            "M 70.949219 28.814453 C 71.031729 28.962971 70.7763 30.505407 70.099609 31.371094 C 69.259275 32.446129 68.73152 32.779871 68.898438 34.443359 C 69.232269 37.770334 69.960835 37.772888 69.208984 38.234375 C 67.901348 39.037 66.792035 36.214492 64.902344 36.900391 C 66.368107 38.881547 66.303676 41.32883 65.878906 43.251953 C 65.454148 45.175079 64.679397 45.985549 64.675781 47.478516 C 64.675313 51.956454 68.30722 55.586406 72.785156 55.585938 C 77.26263 55.585751 80.891092 51.955991 80.890625 47.478516 C 80.887225 45.846615 79.776213 45.015892 79.46875 42.908203 C 79.161286 40.800516 81.238296 37.303027 78.785156 35.017578 C 77.849111 37.779213 76.553764 37.961577 75.591797 37.589844 C 74.62983 37.218111 75.666997 36.275131 75.857422 34.763672 C 75.782402 33.295168 75.054103 32.476967 76.630859 30.939453 C 74.623447 30.761385 74.075361 32.424763 73.855469 33.333984 C 73.582905 34.460944 72.707715 34.841264 72.015625 34.669922 C 71.323534 34.498579 71.041763 33.153972 71.572266 31.494141 C 72.222139 29.46083 70.987674 28.775998 70.949219 28.814453 z M 76.158203 42.890625 C 75.568943 43.454531 75.229627 44.50817 75.716797 44.880859 C 75.998047 45.096022 77.673611 46.419176 77.212891 48.033203 C 76.703151 49.818939 76.353098 49.789353 75.648438 49.955078 C 74.667587 50.185755 73.673651 49.691864 73.332031 48.841797 C 75.021531 49.129856 75.429256 48.149132 75.410156 47.460938 C 75.385676 46.581374 73.280233 45.911511 72.283203 46.451172 C 71.352713 46.954816 70.661462 48.827893 70.945312 49.613281 C 71.229167 50.398667 71.667396 51.349732 72.691406 51.589844 C 73.715426 51.829954 74.480227 51.794264 75.367188 51.320312 C 74.554537 52.480205 73.842385 52.9112 72.203125 52.763672 C 70.389775 52.600476 68.615656 51.5558 68.208984 49.667969 C 67.90846 48.272888 68.590302 46.580091 69.353516 45.667969 C 69.855763 45.067732 70.040106 43.722779 69.671875 43 C 70.516267 43.127803 71.340816 44.475239 72.628906 44.236328 C 73.916996 43.997418 75.145463 42.890625 76.158203 42.890625 z"
    in
    styled g
        style
        []
        [ styled path
            shimmerStyle
            [ d pathData ]
            []
        ]
