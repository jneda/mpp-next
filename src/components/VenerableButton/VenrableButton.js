export default function VenerableButton() {
  return (
    <button
      style={{
        color: "transparent",
        border: "32px solid hotpink",
        borderRadius: "50% 50% 0 0",
        height: "200px",
        width: "200px"
      }}
      onClick={() => alert("coucou !")}
    >
      {" "}
      Clique moi !
    </button>
  );
}
