export default function VenerableButton() {
  return (
    <button
      style={{
        backgroundColor: "transparent",
        border: "32px solid hotpink",
        width: "250px",
        height: "250px",
        borderRadius: "50% 50% 0 0",
        display: "block",
        margin: "72vh auto 0"
      }}
      onClick={() => alert("coucou !")}
    ></button>
  );
}
