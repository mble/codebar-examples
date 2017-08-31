import "./style";
import { Component } from "preact";
import { Result } from "./result";

export default class App extends Component {
  componentDidMount() {
    let ws = new WebSocket("ws://localhost:4000");
    let results = [];
    ws.onmessage = msg => {
      let data = JSON.parse(msg.data);
      results = results.concat(data);
      this.setState({ results: results });
    };
  }

  render(props, { results = [] }) {
    return (
      <div>
        <h1>Example</h1>
        <div class="list">
          {results.map(result => <Result result={result} />)}
        </div>
      </div>
    );
  }
}
