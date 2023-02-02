import React, { Component, useState } from "react";

import RoundSlider from "./slider/RoundSlider";
import "./style.css";

export const Legends = ({ className, value }) => {
  return <div className={className}>{value} &#176;</div>;
};

export const Tooltip = ({ progressVal }) => {
  return (
    <div className="tooltip-container">
      <div className="tooltip-head">{progressVal} &#176; F</div>
      <div classNAme="tooltip-body">5kwh 4s/h</div>
    </div>
  );
};

const Slider = () => {
  const [silderValue, setSliderValue] = useState(75);
  const [minVal, setMinVal] = useState(-20);
  const [maxVal, setMaxVal] = useState(160);

  const legendArr = [
    { className: "min-legend", value: -20 },
    { className: "left-legend", value: -5 },
    { className: "top-legend", value: 60 },
    { className: "right-legend", value: 105 },
    { className: "max-legend", value: 160 }
  ];

  const onValChange = function (e) {
    // Attach any custom behavior here
    // for the round slider value changes

    setSliderValue(e.value);
  };

  const updateTooltip = function (e) {
    return `${e.value} &#176;`;
  };

  const changeStateValue = function () {
    var val = document.getElementById("stateValue").value;

    setSliderValue(val);
  };

  const slideUp = () => {
    setSliderValue(silderValue + 0.5);
  };
  const slideDown = () => {
    setSliderValue(silderValue - 0.5);
  };

  return (
    <div className="container">
      <div className="slider-container">
        {legendArr &&
          legendArr.length > 0 &&
          legendArr.map((x) => {
            return (
              <Legends className={x.className} value={x.value} key={x.value} />
            );
          })}
        <RoundSlider
          sliderType="min-range"
          update={onValChange}
          value={silderValue}
          startAngle="320"
          endAngle="220"
          radius="135"
          width="18"
          min={minVal}
          max={maxVal}
          step="0.5"
          tooltipFormat={updateTooltip}
          pathColor="white"
          handleShape="circle"
          borderColor="darkBlue"
          borderWidth="2"
          showTooltip="false"
        />

        <div className="inner-circle">
          <div className="dot">
            <Tooltip progressVal={silderValue} />
          </div>
        </div>
      </div>
    </div>
  );
};

export default Slider;
