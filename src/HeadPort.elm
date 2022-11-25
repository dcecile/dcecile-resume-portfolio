port module HeadPort exposing (sendHead)

import Head exposing (Head)


port sendHead : Head -> Cmd msg
