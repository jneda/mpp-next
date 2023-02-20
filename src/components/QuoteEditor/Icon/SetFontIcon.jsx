import * as React from "react"

const SetFontIcon = (props) => (
  <svg
    width={800}
    height={800}
    viewBox="-0.29 0 20.59 20.59"
    xmlns="http://www.w3.org/2000/svg"
    {...props}
    pointerEvents={"all"}
    onClick={() => props.clickhandler(props.name)}
  >
    {/* Rect needed to make icon clickable in Firefox */}
    <rect x="0" y="0" width="100%" height="100%" fill="none" />
    <g
      fill="none"
      stroke="#000"
      strokeLinecap="round"
      strokeLinejoin="round"
      strokeWidth={2}
    >
      <path d="m2 19.295 7-18h2l7 18" />
      <path
        data-name="primary"
        d="m17 19.295-7-18M5 13.295h10m-11 6H1m14 0h4"
      />
    </g>
  </svg>
)

export default SetFontIcon