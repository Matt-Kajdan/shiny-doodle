<style>
    #main-axis {
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 6rem;
        max-width: 100vw;
    }

    #logo {
        display: flex;
        align-items: center;
        justify-content: flex-start;
    }

    #logo svg {
        height: 2rem;
        padding: 2rem;
    }

    #logo:hover {
        cursor: pointer;
    }

    #logo svg path {
        fill: currentColor;
        transition: fill 0.15s linear;
    }

    #logo:hover svg path {
        fill: #777;
    }

    a:hover {
        color: #777;
    }

    #buttons {
        display: flex;
        justify-content: flex-end;
    }

    #buttons a {
        height: 2rem;
        display: flex;
        align-items: center;
        font-size: 1.1rem;
        padding: 2rem;
        transition: color 0.1s linear;
    }
</style>

<nav id="main-axis">
    <a id="logo" href="/">
        <!-- Inline SVG -->
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 575.37 255">
            <g id="MK24">
                <path fill="#ddd" d="M76.9,255H26.31c-16.81,0-29.3-15.55-25.68-31.96L45.26,20.63C47.92,8.58,58.6,0,70.94,0h60.83c10.98,0,20.8,6.82,24.64,17.11l8.65,23.19c8.51,22.83,40.81,22.8,49.29-.04l8.58-23.12c3.83-10.31,13.66-17.14,24.65-17.14h61.04c12.35,0,23.03,8.59,25.68,20.65l44.51,202.41c3.61,16.41-8.88,31.94-25.68,31.94h-50.53c-12.58,0-23.41-8.92-25.81-21.27l-3.08-15.81c-5.09-26.12-41.31-29.03-50.49-4.05l-8.79,23.91c-3.8,10.35-13.66,17.22-24.68,17.22h0c-11.02,0-20.87-6.87-24.68-17.21l-8.82-23.94c-9.2-24.97-45.42-22.05-50.49,4.08l-3.07,15.79c-2.4,12.36-13.22,21.28-25.81,21.28ZM461.51,9.79l-81.76,101.41c-7.77,9.64-7.77,23.4.02,33.03l81.6,101c4.99,6.18,12.51,9.77,20.45,9.77h66.78c22.04,0,34.3-25.48,20.55-42.7l-54.56-68.34c-7.68-9.62-7.66-23.28.05-32.87l54.88-68.32c13.82-17.21,1.57-42.76-20.5-42.76h-67.04c-7.95,0-15.48,3.6-20.47,9.79Z"/>
            </g>
        </svg>
    </a>
    <ul id="buttons">
            <a href="./">Work</a>
            <a href="./contact">Contact</a>
    </ul>
</nav>
