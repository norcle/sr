import React from "react";

class Cable extends React.Component {
    constructor(props) {
        super(props);
        this.subscription = null;
    }

    componentDidMount () {
        this.setupSubscription();
    }

    setupSubscription() {
        this.subscription = window.App.cable.subscriptions.create(
            {channel: 'MatchChannel'},
            {
                received (data) {
                    console.log(data);
                },
                connected () {
                    console.log('connected')
                },
            }
        )
    }
    render () {
        return (
            <div>
                <h1>Cable not work</h1>
            </div>
        )
    }
}

export default Cable

